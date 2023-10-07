import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/my_game.dart';

class HearthEnemy extends BodyComponent<MyGame> {
  static Vector2 size = Vector2(1.13, .68);
  final speed = 1.0 + (2.0 * random.nextDouble());

  Vector2 _position;
  bool destroy = false;

  HearthEnemy({
    required double x,
    required double y,
  }) : _position = Vector2(x, y);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;

    add(
      SpriteAnimationComponent(
        animation: Assets.hearthEnemy.clone(),
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
