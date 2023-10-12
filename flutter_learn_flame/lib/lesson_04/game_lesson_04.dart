import 'package:flame/input.dart';
import 'package:flutter_learn_flame/lesson_04/objects/ball.dart';
import 'package:flutter_learn_flame/lesson_04/objects/floor.dart';
import 'package:flutter_learn_flame/my_game.dart';

class GameLesson04 extends MyGame with TapDetector {
  final balls = [Ball(2), Ball(6), Ball(10)];
  final speed = Vector2(0, -9);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    camera.moveTo(worldSize / 2);

    world.add(Floor());
    world.addAll(balls);
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    balls[0].body.applyForce(speed);
    balls[1].body.applyLinearImpulse(speed);
    balls[2].body.linearVelocity = speed;
  }
}
