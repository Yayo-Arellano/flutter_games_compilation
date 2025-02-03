import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/my_game.dart';

/// There are 18 different platforms
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
  // Helper to get the sprite that we will draw on screen
  Sprite get sprite {
    return switch (this) {
      PlatformType.beige => Assets.platformBeige,
      PlatformType.blue => Assets.platformBlue,
      PlatformType.blueLight => Assets.platformBlueLight,
      PlatformType.beigeLight => Assets.platformBeigeLight,
      PlatformType.beigeBroken => Assets.platformBeigeBroken,
      PlatformType.blueBroken => Assets.platformBlueBroken,
      PlatformType.gray => Assets.platformGray,
      PlatformType.grayLight => Assets.platformGrayLight,
      PlatformType.grayBroken => Assets.platformGrayBroken,
      PlatformType.green => Assets.platformGreen,
      PlatformType.greenLight => Assets.platformGreenLight,
      PlatformType.greenBroken => Assets.platformGreenBroken,
      PlatformType.multicolor => Assets.platformMulticolor,
      PlatformType.multicolorLight => Assets.platformMulticolorLight,
      PlatformType.multicolorBroken => Assets.platformMulticolorBroken,
      PlatformType.pink => Assets.platformPink,
      PlatformType.pinkLight => Assets.platformPinkLight,
      PlatformType.pinkBroken => Assets.platformPinkBroken
    };
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
  final Vector2 _initialPosition;
  bool destroy = false;

  final PlatformType type;

  Platform({
    required double x,
    required double y,
  })  : _initialPosition = Vector2(x, y),
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
      position: _initialPosition,
      type: BodyType.static,
    );

    final shape = PolygonShape()..setAsBoxXY(.58, .23);
    final fixtureDef = FixtureDef(shape);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
