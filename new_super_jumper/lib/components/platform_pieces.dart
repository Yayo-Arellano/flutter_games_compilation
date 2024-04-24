import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/my_game.dart';
import 'package:new_super_jumper/components/platform.dart';

class PlatformPieces extends BodyComponent<MyGame> {
  static Vector2 size = Vector2(.62, .5);
  final bool isLeftSide;
  final Vector2 _position;
  final PlatformType type;

  PlatformPieces({
    required double x,
    required double y,
    required this.isLeftSide,
    required this.type,
  }) : _position = Vector2(x, y);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;
    late Sprite sprite;

    switch (type) {
      case PlatformType.beigeBroken:
        if (isLeftSide) {
          sprite = Assets.platformBeigeLeft;
        } else {
          sprite = Assets.platformBeigeRight;
        }
        break;
      case PlatformType.blueBroken:
        if (isLeftSide) {
          sprite = Assets.platformBlueLeft;
        } else {
          sprite = Assets.platformBlueRight;
        }
        break;
      case PlatformType.grayBroken:
        if (isLeftSide) {
          sprite = Assets.platformGrayLeft;
        } else {
          sprite = Assets.platformGrayRight;
        }
        break;
      case PlatformType.greenBroken:
        if (isLeftSide) {
          sprite = Assets.platformGreenLeft;
        } else {
          sprite = Assets.platformGreenRight;
        }
        break;
      case PlatformType.multicolorBroken:
        if (isLeftSide) {
          sprite = Assets.platformMulticolorLeft;
        } else {
          sprite = Assets.platformMulticolorRight;
        }
        break;
      case PlatformType.pinkBroken:
        if (isLeftSide) {
          sprite = Assets.platformPinkLeft;
        } else {
          sprite = Assets.platformPinkRight;
        }
        break;
      default:
        throw ('Wrong platform type exception');
    }

    add(
      SpriteComponent(
        sprite: sprite,
        size: size,
        anchor: Anchor.center,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    bool isOutOfScreen = game.isOutOfScreen(body.position);
    if (isOutOfScreen) {
      world.destroyBody(body);
      world.remove(this);
    }
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: _position,
      type: BodyType.dynamic,
    );

    final angularVelocity = isLeftSide ? radians(100) : radians(-100);

    final shape = PolygonShape()..setAsBoxXY(.2, .11);
    final fixtureDef = FixtureDef(shape)
      ..isSensor = true
      ..density = 20;
    return world.createBody(bodyDef)
      ..createFixture(fixtureDef)
      ..angularVelocity = angularVelocity;
  }
}
