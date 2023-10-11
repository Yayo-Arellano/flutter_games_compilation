import 'package:flutter_learn_flame/lesson_02/objects/ball_dynamic.dart';
import 'package:flutter_learn_flame/lesson_02/objects/box_kinematic.dart';
import 'package:flutter_learn_flame/lesson_02/objects/floor_static.dart';
import 'package:flutter_learn_flame/my_game.dart';

class GameLesson02 extends MyGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    world.add(FloorStatic());
    world.add(BallDynamic());
    world.add(BoxKinematic());
  }
}
