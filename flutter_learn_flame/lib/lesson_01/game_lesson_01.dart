import 'package:flutter_learn_flame/lesson_01/objects/ball.dart';
import 'package:flutter_learn_flame/my_game.dart';

class GameLesson01 extends MyGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    camera.moveTo(worldSize / 2);

    world.add(Ball());
  }
}
