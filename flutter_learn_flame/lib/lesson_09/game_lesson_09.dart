import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learn_flame/lesson_09/objects/floor.dart';
import 'package:flutter_learn_flame/lesson_09/objects/platform.dart';
import 'package:flutter_learn_flame/lesson_09/objects/robot.dart';
import 'package:flutter_learn_flame/my_game.dart';

void main() {
  runApp(GameWidget(game: GameLesson09()));
}

class GameLesson09 extends MyGame {
  final robot = Robot();

  @override
  Future<void> onLoad() async {
    super.onLoad();

    await loadSprite('platform.png');

    add(Floor());
    add(Platform(x: 3, y: 4));
    add(Platform(x: 12, y: 1));
    add(Platform(x: 7, y: -2));
    add(Platform(x: 2, y: -5));
    add(Platform(x: 5, y: -8));
    add(Platform(x: 7, y: -11));
    add(Platform(x: 9, y: -14));
    await add(robot);

    final worldBounds =
        Rect.fromLTRB(0, -double.infinity, worldSize.x, worldSize.y);
    camera.followBodyComponent(robot, worldBounds: worldBounds);
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
