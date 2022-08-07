import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/my_game.dart';
import 'package:new_super_jumper/objects/platform.dart';

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

    bool isOutOfScreen = gameRef.isOutOfScreen(body.position);
    if (isOutOfScreen) {
      world.destroyBody(body);
      gameRef.remove(this);
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
