import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_learn_flame/my_game.dart';

class BallDynamic extends BodyComponent {
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(worldSize.x / 2, 0),
      type: BodyType.dynamic,
    );

    final shape = CircleShape()..radius = .35;
    final fixtureDef = FixtureDef(shape);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
