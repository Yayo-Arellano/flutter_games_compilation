import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter_learn_flame/lesson_07/objects/ball.dart';
import 'package:flutter_learn_flame/lesson_07/objects/box.dart';
import 'package:flutter_learn_flame/lesson_07/objects/floor.dart';
import 'package:flutter_learn_flame/my_game.dart';

late SpriteAnimation explosion;

class GameLesson07 extends MyGame with TapDetector {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await loadSprite('ball.png');
    await loadSprite('box.png');

    final exp1 = await loadSprite('explosion/explosion1.png');
    final exp2 = await loadSprite('explosion/explosion2.png');
    final exp3 = await loadSprite('explosion/explosion3.png');
    final exp4 = await loadSprite('explosion/explosion4.png');
    final exp5 = await loadSprite('explosion/explosion5.png');
    final exp6 = await loadSprite('explosion/explosion6.png');
    final exp7 = await loadSprite('explosion/explosion7.png');
    final exp8 = await loadSprite('explosion/explosion8.png');
    final exp9 = await loadSprite('explosion/explosion9.png');
    final exp10 = await loadSprite('explosion/explosion10.png');
    final exp11 = await loadSprite('explosion/explosion11.png');
    final exp12 = await loadSprite('explosion/explosion12.png');
    final exp13 = await loadSprite('explosion/explosion13.png');
    final exp14 = await loadSprite('explosion/explosion14.png');
    final exp15 = await loadSprite('explosion/explosion15.png');
    final exp16 = await loadSprite('explosion/explosion16.png');
    final exp17 = await loadSprite('explosion/explosion17.png');
    final exp18 = await loadSprite('explosion/explosion18.png');
    final exp19 = await loadSprite('explosion/explosion19.png');

    explosion = SpriteAnimation.spriteList([
      exp1,
      exp2,
      exp3,
      exp4,
      exp5,
      exp6,
      exp7,
      exp8,
      exp9,
      exp10,
      exp11,
      exp12,
      exp13,
      exp14,
      exp15,
      exp16,
      exp17,
      exp18,
      exp19
    ], stepTime: 0.05, loop: false);

    add(Floor());
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    if (Random.secure().nextBool()) {
      add(Ball());
    } else {
      add(Box());
    }
  }
}
