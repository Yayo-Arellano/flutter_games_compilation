import 'package:flame_forge2d/flame_forge2d.dart';

class Box extends BodyComponent {
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(10, 0),
      type: BodyType.dynamic,
    );

    final shape = PolygonShape()..setAsBoxXY(.25, .25);
    final fixtureDef = FixtureDef(shape)
      ..density = 5
      ..friction = .25
      ..restitution = .1;
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
