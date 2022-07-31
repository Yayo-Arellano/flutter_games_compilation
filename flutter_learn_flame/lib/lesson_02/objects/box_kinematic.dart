import 'package:flame/input.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_learn_flame/my_game.dart';

class BoxKinematic extends BodyComponent {
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(worldSize.x / 2, worldSize.y / 2),
      type: BodyType.kinematic,
    );

    final shape = PolygonShape()..setAsBoxXY(.15, 1.25);

    final fixtureDef = FixtureDef(shape);
    return world.createBody(bodyDef)
      ..createFixture(fixtureDef)
      ..angularVelocity = radians(180);
  }
}
