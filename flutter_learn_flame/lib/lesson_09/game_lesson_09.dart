import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learn_flame/lesson_09/objects/coin.dart';
import 'package:flutter_learn_flame/lesson_09/objects/floor.dart';
import 'package:flutter_learn_flame/lesson_09/objects/platform.dart';
import 'package:flutter_learn_flame/lesson_09/objects/robot.dart';
import 'package:flutter_learn_flame/my_game.dart';

void main() {
  runApp(GameWidget(game: GameLesson09()));
}

late SpriteAnimation coin;

class GameLesson09 extends MyGame {
  final robot = Robot();

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final coin1 = await loadSprite('coin/coin1.png');
    final coin2 = await loadSprite('coin/coin2.png');
    final coin3 = await loadSprite('coin/coin3.png');
    final coin4 = await loadSprite('coin/coin4.png');
    final coin5 = await loadSprite('coin/coin5.png');
    final coin6 = await loadSprite('coin/coin6.png');
    final coin7 = await loadSprite('coin/coin7.png');
    final coin8 = await loadSprite('coin/coin8.png');
    final coin9 = await loadSprite('coin/coin9.png');

    coin = SpriteAnimation.spriteList([
      coin1,
      coin2,
      coin3,
      coin4,
      coin5,
      coin6,
      coin7,
      coin8,
      coin9,
    ], stepTime: 0.15, loop: true);

    await loadSprite('platform.png');

    world.add(Floor());

    final ran = Random();
    const previousX = 0;
    for (int i = 0; i < 100; i++) {
      var x = (ran.nextDouble() * (worldSize.x - 6)) + 3;

      final y = 4.0 - (i * 3);
      world.add(Platform(x: x, y: y));
      world.add(Coin(x: x, y: y - 1));
    }

    // add(Platform(x: 3, y: 4));
    // add(Coin(x: 3, y: 3));
    //
    // add(Platform(x: 12, y: 1));
    // add(Coin(x: 12, y: 0));
    //
    // add(Platform(x: 7, y: -2));
    // add(Platform(x: 2, y: -5));
    // add(Platform(x: 5, y: -8));
    // add(Platform(x: 7, y: -11));
    // add(Platform(x: 9, y: -14));
    await world.add(robot);
    //
    // final worldBounds =
    //     Rect.fromLTRB(0, -double.infinity, worldSize.x, worldSize.y);
    // camera.followBodyComponent(robot, worldBounds: worldBounds);
    camera.follow(robot);
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
