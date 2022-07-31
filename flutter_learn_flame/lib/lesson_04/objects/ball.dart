import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_learn_flame/my_game.dart';

class Ball extends BodyComponent {
  final double positionX;

  Ball(this.positionX);

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(positionX, worldSize.y - 1),
      type: BodyType.dynamic,
    );

    final shape = CircleShape()..radius = .35;
    final fixtureDef = FixtureDef(shape)
      ..density = 5
      ..friction = .5
      ..restitution = .5;
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
