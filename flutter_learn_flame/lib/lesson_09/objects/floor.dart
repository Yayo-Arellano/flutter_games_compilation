import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_learn_flame/my_game.dart';

class Floor extends BodyComponent {

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(0, worldSize.y - .75),
      type: BodyType.static,
    );

    final shape = EdgeShape()..set(Vector2.zero(), Vector2(worldSize.x, 0));

    final fixtureDef = FixtureDef(shape)..friction = .7;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
