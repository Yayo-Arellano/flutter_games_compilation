import 'dart:math';

import 'package:flame/input.dart';
import 'package:flutter_learn_flame/lesson_05/objects/ball.dart';
import 'package:flutter_learn_flame/lesson_05/objects/box.dart';
import 'package:flutter_learn_flame/lesson_05/objects/floor.dart';
import 'package:flutter_learn_flame/my_game.dart';

class GameLesson05 extends MyGame with TapDetector {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await loadSprite('ball.png');
    await loadSprite('box.png');

    add(Floor());
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    if (Random().nextBool()) {
      add(Ball());
    } else {
      add(Box());
    }
  }
}
