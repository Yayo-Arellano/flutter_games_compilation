import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/my_game.dart';
import 'package:new_super_jumper/components/lightning.dart';

const _timeForNextLightning = 5.0;

class CloudEnemy extends BodyComponent<MyGame> {
  static Vector2 size = Vector2(1.55, .83);
  final speed = 1.0 + (1.0 * random.nextDouble());

  double timeForNextLightning = _timeForNextLightning * random.nextDouble();

  Vector2 _position;
  bool destroy = false;

  CloudEnemy({
    required double x,
    required double y,
  }) : _position = Vector2(x, y);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;

    add(
      SpriteComponent(
        sprite: Assets.cloudHappyEnemy,
        anchor: Anchor.center,
        size: size,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    _position = body.position;

    if (_position.x > worldSize.x) {
      body.linearVelocity = Vector2(-speed, 0);
    } else if (_position.x < 0) {
      body.linearVelocity = Vector2(speed, 0);
    }

    timeForNextLightning += dt;
    if (timeForNextLightning > _timeForNextLightning) {
      timeForNextLightning -= _timeForNextLightning;
      world.add(Lightning(
        x: _position.x,
        y: _position.y + 0.5,
      ));
    }

    bool isOutOfScreen = game.isOutOfScreen(body.position);

    if (destroy || isOutOfScreen) {
      world.destroyBody(body);
      world.remove(this);
    }
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: _position,
      type: BodyType.kinematic,
    );

    final randomSpeed = random.nextBool() ? speed : -speed;

    final shape = PolygonShape()..setAsBoxXY(.3, .2);
    final fixtureDef = FixtureDef(shape)..isSensor = true;
    return world.createBody(bodyDef)
      ..createFixture(fixtureDef)
      ..linearVelocity = Vector2(randomSpeed, 0);
  }
}
