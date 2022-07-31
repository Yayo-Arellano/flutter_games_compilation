import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_learn_flame/lesson_06/objects/object_state.dart';
import 'package:flutter_learn_flame/my_game.dart';

class Box extends BodyComponent with ContactCallbacks {
  ObjectState state = ObjectState.normal;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;
    final sprite = Sprite(gameRef.images.fromCache('box.png'));
    add(
      SpriteComponent(
        sprite: sprite,
        size: Vector2(.5, .5),
        anchor: Anchor.center,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (state == ObjectState.explode) {
      world.destroyBody(body);
      gameRef.remove(this);
    }
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2(Random().nextDouble() * worldSize.x, 0),
      type: BodyType.dynamic,
    );

    final shape = PolygonShape()
      ..setAsBoxXY(.25, .25);

    final fixtureDef = FixtureDef(shape)
      ..density = 5
      ..friction = .5
      ..restitution = .5;

    return world.createBody(bodyDef)
      ..createFixture(fixtureDef)
      ..angularVelocity = radians(180);
  }

  void hit() {
    if (state == ObjectState.normal) {
      state = ObjectState.explode;
    }
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Box) {
      hit();
    }
  }
}
