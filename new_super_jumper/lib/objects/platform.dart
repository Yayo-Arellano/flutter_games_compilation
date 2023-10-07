import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/my_game.dart';

enum PlatformType {
  blue,
  blueLight,
  blueBroken,
  beige,
  beigeLight,
  beigeBroken,
  gray,
  grayLight,
  grayBroken,
  green,
  greenLight,
  greenBroken,
  multicolor,
  multicolorLight,
  multicolorBroken,
  pink,
  pinkLight,
  pinkBroken,
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
      case PlatformType.gray:
        return Assets.platformGray;
      case PlatformType.grayLight:
        return Assets.platformGrayLight;
      case PlatformType.grayBroken:
        return Assets.platformGrayBroken;
      case PlatformType.green:
        return Assets.platformGreen;
      case PlatformType.greenLight:
        return Assets.platformGreenLight;
      case PlatformType.greenBroken:
        return Assets.platformGreenBroken;
      case PlatformType.multicolor:
        return Assets.platformMulticolor;
      case PlatformType.multicolorLight:
        return Assets.platformMulticolorLight;
      case PlatformType.multicolorBroken:
        return Assets.platformMulticolorBroken;
      case PlatformType.pink:
        return Assets.platformPink;
      case PlatformType.pinkLight:
        return Assets.platformPinkLight;
      case PlatformType.pinkBroken:
        return Assets.platformPinkBroken;
    }
  }

  bool get isBroken {
    switch (this) {
      case PlatformType.blueBroken:
      case PlatformType.beigeBroken:
      case PlatformType.grayBroken:
      case PlatformType.greenBroken:
      case PlatformType.multicolorBroken:
      case PlatformType.pinkBroken:
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
        type = PlatformType.values
            .elementAt(random.nextInt(PlatformType.values.length));

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

    bool isOutOfScreen = game.isOutOfScreen(body.position);

    if (destroy || isOutOfScreen) {
      world.destroyBody(body);
      world.remove(this);
      if (type.isBroken) game.addBrokenPlatformPieces(this);
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
