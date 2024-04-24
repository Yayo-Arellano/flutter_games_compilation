import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/my_game.dart';
import 'package:new_super_jumper/components/hearth_enemy.dart';

class Bullet extends BodyComponent<MyGame> with ContactCallbacks {
  static Vector2 size = Vector2(.15, .15);
  final double accelX;
  final Vector2 _position;
  bool isTaken = false;

  Bullet({
    required double x,
    required double y,
    required this.accelX,
  }) : _position = Vector2(x, y);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // renderBody = false;

    add(
      SpriteComponent(
        sprite: Assets.bullet,
        size: size,
        anchor: Anchor.center,
      ),
    );
  }

  void take() {
    isTaken = true;
  }

  @override
  void update(double dt) {
    super.update(dt);

    bool isOutOfScreen = game.isOutOfScreen(body.position);

    if (isTaken || isOutOfScreen) {
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

    final shape = CircleShape()..radius = .075;
    final fixtureDef = FixtureDef(shape)
      ..density = .1
      ..isSensor = true;
    return world.createBody(bodyDef)
      ..createFixture(fixtureDef)
      ..gravityScale = Vector2.all(0)
      ..linearVelocity = Vector2(accelX, -10);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is HearthEnemy) {
      other.destroy = true;
    }
  }
}
