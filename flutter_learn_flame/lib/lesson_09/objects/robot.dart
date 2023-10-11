import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_learn_flame/my_game.dart';

enum RobotState {
  duck,
  fall,
  idle,
  jump,
  walk,
}

class Robot extends BodyComponent with KeyboardHandler {
  final _size = Vector2(1.80, 2.4);
  final _componentPosition = Vector2(0, -.325);
  RobotState state = RobotState.idle;

  late final SpriteComponent duckComponent;
  late final SpriteComponent fallComponent;
  late final SpriteComponent idleComponent;
  late final SpriteComponent jumpComponent;
  late final SpriteAnimationComponent walkComponent;

  late Component currentComponent;

  int accelerationX = 0;
  bool isDucking = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;

    final duck = await game.loadSprite('robot/robot_duck.png');
    final fall = await game.loadSprite('robot/robot_fall.png');
    final idle = await game.loadSprite('robot/robot_idle.png');
    final jump = await game.loadSprite('robot/robot_jump.png');
    final walk0 = await game.loadSprite('robot/robot_walk0.png');
    final walk1 = await game.loadSprite('robot/robot_walk1.png');
    final walk2 = await game.loadSprite('robot/robot_walk2.png');
    final walk3 = await game.loadSprite('robot/robot_walk3.png');
    final walk4 = await game.loadSprite('robot/robot_walk4.png');
    final walk5 = await game.loadSprite('robot/robot_walk5.png');
    final walk6 = await game.loadSprite('robot/robot_walk6.png');
    final walk7 = await game.loadSprite('robot/robot_walk7.png');

    duckComponent = SpriteComponent(
      sprite: duck,
      size: _size,
      position: _componentPosition,
      anchor: Anchor.center,
    );

    fallComponent = SpriteComponent(
      sprite: fall,
      size: _size,
      position: _componentPosition,
      anchor: Anchor.center,
    );

    idleComponent = SpriteComponent(
      sprite: idle,
      size: _size,
      position: _componentPosition,
      anchor: Anchor.center,
    );

    jumpComponent = SpriteComponent(
      sprite: jump,
      size: _size,
      position: _componentPosition,
      anchor: Anchor.center,
    );

    final walkAnimation = SpriteAnimation.spriteList([
      walk0,
      walk1,
      walk2,
      walk3,
      walk4,
      walk5,
      walk6,
      walk7,
    ], stepTime: 0.05, loop: true);

    walkComponent = SpriteAnimationComponent(
        animation: walkAnimation,
        anchor: Anchor.center,
        position: _componentPosition,
        size: _size,
        removeOnFinish: false);

    currentComponent = idleComponent;
    add(idleComponent);
  }

  void idle() {
    accelerationX = 0;
    isDucking = false;
  }

  void walkLeft() {
    accelerationX = -1;
  }

  void walkRight() {
    accelerationX = 1;
  }

  void duck() {
    isDucking = true;
  }

  void jump() {
    if (state == RobotState.jump || state == RobotState.fall) return;
    final velocity = body.linearVelocity;
    body.linearVelocity = Vector2(velocity.x, -10);
    state = RobotState.jump;
  }

  @override
  void update(double dt) {
    super.update(dt);

    final velocity = body.linearVelocity;
    final position = body.position;

    if (velocity.y > 0.1) {
      state = RobotState.fall;
    } else if (velocity.y < 0.1 && state != RobotState.jump) {
      if (accelerationX != 0) {
        state = RobotState.walk;
      } else if (isDucking) {
        state = RobotState.duck;
      } else {
        state = RobotState.idle;
      }
    }

    velocity.x = accelerationX * 3;
    body.linearVelocity = velocity;

    if (position.x > worldSize.x) {
      position.x = 0;
      body.setTransform(position, 0);
    } else if (position.x < 0) {
      position.x = worldSize.x;
      body.setTransform(position, 0);
    }

    if (state == RobotState.jump) {
      _setComponent(jumpComponent);
    } else if (state == RobotState.fall) {
      _setComponent(fallComponent);
    } else if (state == RobotState.walk) {
      _setComponent(walkComponent);
    } else if (state == RobotState.duck) {
      _setComponent(duckComponent);
    } else if (state == RobotState.idle) {
      _setComponent(idleComponent);
    }
  }

  void _setComponent(PositionComponent component) {
    if (accelerationX < 0) {
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
      position: Vector2(worldSize.x / 2, worldSize.y - 3),
      type: BodyType.dynamic,
    );

    final shape = PolygonShape()..setAsBoxXY(_size.x / 2, .90);

    final fixtureDef = FixtureDef(shape)
      ..density = 15
      ..friction = 0
      ..restitution = 0;
    return world.createBody(bodyDef)
      ..createFixture(fixtureDef)
      ..setFixedRotation(true);
  }
}
