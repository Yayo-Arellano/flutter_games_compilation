import 'dart:math';

import 'package:flame/events.dart';
import 'package:flutter_learn_flame/lesson_05/objects/ball.dart';
import 'package:flutter_learn_flame/lesson_05/objects/box.dart';
import 'package:flutter_learn_flame/lesson_05/objects/floor.dart';
import 'package:flutter_learn_flame/my_game.dart';

class GameLesson05 extends MyGame with TapCallbacks {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    camera.moveTo(worldSize / 2);

    await loadSprite('ball.png');
    await loadSprite('box.png');

    world.add(Floor());
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    if (Random().nextBool()) {
      world.add(Ball());
    } else {
      world.add(Box());
    }
  }
}
