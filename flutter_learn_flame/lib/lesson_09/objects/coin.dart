import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_learn_flame/lesson_09/game_lesson_09.dart';
import 'package:flutter_learn_flame/lesson_09/objects/robot.dart';

class Coin extends BodyComponent with ContactCallbacks {
  bool isTaken = false;

  final Vector2 position;

  Coin({
    required double x,
    required double y,
  }) : position = Vector2(x, y);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;

    add(SpriteAnimationComponent(
      animation: coin.clone(),
      anchor: Anchor.center,
      size: Vector2(1, 1),
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (isTaken) {
      world.destroyBody(body);
      gameRef.remove(this);
    }
  }

  void hit() {
    isTaken = true;
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: position,
      type: BodyType.kinematic,
    );

    final shape = CircleShape()..radius = .1;
    final fixtureDef = FixtureDef(shape);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Robot) {
      hit();
    }
  }
}
