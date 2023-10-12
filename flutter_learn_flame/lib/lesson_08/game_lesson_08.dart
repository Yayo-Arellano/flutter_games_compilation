import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learn_flame/lesson_08/objects/floor.dart';
import 'package:flutter_learn_flame/lesson_08/objects/robot.dart';
import 'package:flutter_learn_flame/my_game.dart';

void main() {
  runApp(GameWidget(game: GameLesson08()));
}

class GameLesson08 extends MyGame {
  final robot = Robot();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    camera.moveTo(worldSize / 2);

    world.add(Floor());
    await world.add(robot);
  }

  @override
  KeyEventResult onKeyEvent(RawKeyEvent event, Set keysPressed) {
    super.onKeyEvent(event, keysPressed);
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.keyW) {
        robot.jump();
      }
    }

    if (keysPressed.contains(LogicalKeyboardKey.keyD)) {
      robot.walkRight();
    } else if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
      robot.walkLeft();
    } else if (keysPressed.contains(LogicalKeyboardKey.keyS)) {
      robot.duck();
    } else {
      robot.idle();
    }

    return KeyEventResult.handled;
  }
}
