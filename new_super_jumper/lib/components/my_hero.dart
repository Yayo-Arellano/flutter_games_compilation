import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/services.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/my_game.dart';
import 'package:new_super_jumper/components/coin.dart';
import 'package:new_super_jumper/components/floor.dart';
import 'package:new_super_jumper/components/hearth_enemy.dart';
import 'package:new_super_jumper/components/jetpack_group.dart';
import 'package:new_super_jumper/components/lightning.dart';
import 'package:new_super_jumper/components/platform.dart';
import 'package:new_super_jumper/components/power_up.dart';
import 'package:new_super_jumper/utils.dart';
import 'package:sensors_plus/sensors_plus.dart';

enum HeroState {
  jump,
  fall,
  dead,
}

const _durationJetpack = 3.0;

class MyHero extends BodyComponent<MyGame>
    with ContactCallbacks, KeyboardHandler {
  static final size = Vector2(.75, .80);

  var state = HeroState.fall;

  late final SpriteComponent fallComponent;
  late final SpriteComponent jumpComponent;
  final jetpackComponent = JetpackGroup();
  final bubbleShieldComponent = SpriteComponent(
    sprite: Assets.bubble,
    size: Vector2(1, 1),
    anchor: Anchor.center,
    priority: 2,
  );

  late Component currentComponent;

  double accelerationX = 0;

  bool hasJetpack = false;
  bool hasBubbleShield = false;

  double durationJetpack = 0;

  StreamSubscription? accelerometerSubscription;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;

    if (isMobile || isWeb) {
      accelerometerSubscription = accelerometerEventStream().listen((event) {
        accelerationX = (event.x * -1).clamp(-1, 1);
      });
    }

    fallComponent = SpriteComponent(
      sprite: Assets.heroFall,
      size: size,
      anchor: Anchor.center,
    );

    jumpComponent = SpriteComponent(
      sprite: Assets.heroJump,
      size: size,
      anchor: Anchor.center,
    );

    currentComponent = fallComponent;
    add(currentComponent);
  }

  void jump() {
    if (state == HeroState.jump || state == HeroState.dead) return;
    final velocity = body.linearVelocity;
    body.linearVelocity = Vector2(velocity.x, -7.5);
    state = HeroState.jump;
  }

  void hit() {
    if (hasJetpack) return;
    if (state == HeroState.dead) return;

    if (hasBubbleShield) {
      hasBubbleShield = false;
      remove(bubbleShieldComponent);
      return;
    }

    state = HeroState.dead;
    body.setFixedRotation(false);
    body.applyAngularImpulse(2);
  }

  void takeJetpack() {
    if (state == HeroState.dead) return;
    durationJetpack = 0;
    if (!hasJetpack) add(jetpackComponent);
    hasJetpack = true;
  }

  void takeBubbleShield() {
    if (state == HeroState.dead) return;
    if (!hasBubbleShield) add(bubbleShieldComponent);
    hasBubbleShield = true;
  }

  void takeCoin() {
    if (state == HeroState.dead) return;
    game.coins++;
    final velocity = body.linearVelocity;
    body.linearVelocity = Vector2(velocity.x, -8.5);
  }

  void takeBullet() {
    if (state == HeroState.dead) return;
    game.bullets += 25;
  }

  void fireBullet() {
    if (state == HeroState.dead) return;
    game.addBullets();
  }

  @override
  void update(double dt) {
    super.update(dt);

    final velocity = body.linearVelocity;
    final position = body.position;

    if (velocity.y > 0.1 && state != HeroState.dead) {
      state = HeroState.fall;
    }

    if (hasJetpack) {
      durationJetpack += dt;
      if (durationJetpack >= _durationJetpack) {
        hasJetpack = false;
        remove(jetpackComponent);
      }
      velocity.y = -7.5;
    }

    velocity.x = accelerationX * 5;
    body.linearVelocity = velocity;

    if (position.x > worldSize.x) {
      position.x = 0;
      body.setTransform(position, 0);
    } else if (position.x < 0) {
      position.x = worldSize.x;
      body.setTransform(position, 0);
    }

    if (state == HeroState.jump) {
      _setComponent(jumpComponent);
    } else if (state == HeroState.fall) {
      _setComponent(fallComponent);
    } else if (state == HeroState.dead) {
      _setComponent(fallComponent);
    }
  }

  void _setComponent(PositionComponent component) {
    if (accelerationX > 0) {
      if (!component.isFlippedHorizontally) {
        component.flipHorizontally();
      }
    } else {
      if (component.isFlippedHorizontally) {
        component.flipHorizontally();
      }
    }

    if (component == currentComponent) return;
    remove(currentComponent);
    currentComponent = component;
    add(component);
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2(worldSize.x / 2, -0.5),
      type: BodyType.dynamic,
    );

    final shape = PolygonShape()..setAsBoxXY(.27, .30);

    final fixtureDef = FixtureDef(shape, density: 10);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is HearthEnemy) {
      if (hasBubbleShield) {
        other.destroy = true;
      }
      hit();
    }
    if (other is Lightning) {
      hit();
    }
    if (other is Floor) jump();

    if (other is PowerUp) {
      if (other.type == PowerUpType.jetpack) {
        takeJetpack();
      }
      if (other.type == PowerUpType.bubble) {
        takeBubbleShield();
      }
      if (other.type == PowerUpType.gun) {
        takeBullet();
      }
      other.take();
    }

    if (other is Coin) {
      if (!other.isTaken) {
        takeCoin();
        other.take();
      }
    }

    if (other is Platform) {
      if (state == HeroState.fall && other.type.isBroken) {
        other.destroy = true;
      }
      jump();
    }
  }

  @override
  void preSolve(Object other, Contact contact, Manifold oldManifold) {
    if (other is Platform) {
      final heroY = body.position.y - size.y / 2;
      final platformY = other.body.position.y + Platform.size.y / 2;

      if (heroY < platformY) {
        contact.isEnabled = false;
      }
    }
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.keyD)) {
      accelerationX = 1;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
      accelerationX = -1;
    } else {
      accelerationX = 0;
    }

    if (keysPressed.contains(LogicalKeyboardKey.keyR)) {
      fireBullet();
    }

    return false;
  }

  void cancelSensor() {
    accelerometerSubscription?.cancel();
  }
}
