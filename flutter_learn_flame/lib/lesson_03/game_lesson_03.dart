import 'package:flutter_learn_flame/lesson_03/objects/box.dart';
import 'package:flutter_learn_flame/lesson_03/objects/floor.dart';
import 'package:flutter_learn_flame/my_game.dart';

class GameLesson03 extends MyGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(Floor());
    add(Box());
  }
}
