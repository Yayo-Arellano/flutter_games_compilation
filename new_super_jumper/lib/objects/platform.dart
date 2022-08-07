import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/my_game.dart';

enum PlatformType {
  beige,
  blue,
  blueLight,
  beigeLight,
  blueBroken,
  beigeBroken;
}

extension PlatformTypeExtension on PlatformType {
  Sprite get sprite {
    switch (this) {
      case PlatformType.beige:
        return Assets.platformBeige;
      case PlatformType.blue:
        return Assets.platformBlue;
      case PlatformType.blueLight:
        return Assets.platformBlueLight;
      case PlatformType.beigeLight:
        return Assets.platformBeigeLight;
      case PlatformType.beigeBroken:
        return Assets.platformBeigeBroken;
      case PlatformType.blueBroken:
        return Assets.platformBlueBroken;
    }
  }

  bool get isBroken {
    switch (this) {
      case PlatformType.blueBroken:
      case PlatformType.beigeBroken:
        return true;
      default:
        return false;
    }
  }
}

class Platform extends BodyComponent<MyGame> {
  static Vector2 size = Vector2(1.2, .5);
  final Vector2 _position;
  bool destroy = false;

  final PlatformType type;

  Platform({
    required double x,
    required double y,
  })  : _position = Vector2(x, y),
        type = PlatformType.values.elementAt(random.nextInt(6));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;

    add(
      SpriteComponent(
        sprite: type.sprite,
        size: size,
        anchor: Anchor.center,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    bool isOutOfScreen = gameRef.isOutOfScreen(body.position);

    if (destroy || isOutOfScreen) {
      world.destroyBody(body);
      gameRef.remove(this);
      if (type.isBroken) gameRef.addBrokenPlatformPieces(this);
    }
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: _position,
      type: BodyType.static,
    );

    final shape = PolygonShape()..setAsBoxXY(.58, .23);
    final fixtureDef = FixtureDef(shape);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
