import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Platform extends BodyComponent {
  final Vector2 position;

  Platform({
    required double x,
    required double y,
  }) : position = Vector2(x, y);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = Sprite(gameRef.images.fromCache('platform.png'));
    add(
      SpriteComponent(
        sprite: sprite,
        size: Vector2(2, .5),
        anchor: Anchor.center,
      ),
    );
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: position,
      type: BodyType.static,
    );

    final shape = PolygonShape()..setAsBoxXY(.85, .15);

    final fixtureDef = FixtureDef(shape)..friction = .7;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
