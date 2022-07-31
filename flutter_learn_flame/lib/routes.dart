import 'dart:core';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_flame/lesson_01/game_lesson_01.dart';
import 'package:flutter_learn_flame/lesson_02/game_lesson_02.dart';
import 'package:flutter_learn_flame/lesson_03/game_lesson_03.dart';
import 'package:flutter_learn_flame/lesson_04/game_lesson_04.dart';
import 'package:flutter_learn_flame/lesson_05/game_lesson_05.dart';
import 'package:flutter_learn_flame/lesson_06/game_lesson_06.dart';
import 'package:flutter_learn_flame/lesson_07/game_lesson_07.dart';
import 'package:flutter_learn_flame/lesson_08/game_lesson_08.dart';
import 'package:flutter_learn_flame/lesson_09/game_lesson_09.dart';
import 'package:flutter_learn_flame/lesson_menu.dart';
import 'package:flutter_learn_flame/my_game.dart';

class Routes {
  static const menu = '/';
  static const lesson01 = '/lesson01';
  static const lesson02 = '/lesson02';
  static const lesson03 = '/lesson03';
  static const lesson04 = '/lesson04';
  static const lesson05 = '/lesson05';
  static const lesson06 = '/lesson06';
  static const lesson07 = '/lesson07';
  static const lesson08 = '/lesson08';
  static const lesson09 = '/lesson09';

  static Route routes(RouteSettings settings) {
    MaterialPageRoute _buildRoute(Widget widget) {
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    }

    switch (settings.name) {
      case menu:
        return _buildRoute(const LessonMenu());
      case lesson01:
        return _buildRoute(MyGameWidget(game: GameLesson01()));
      case lesson02:
        return _buildRoute(MyGameWidget(game: GameLesson02()));
      case lesson03:
        return _buildRoute(MyGameWidget(game: GameLesson03()));
      case lesson04:
        return _buildRoute(MyGameWidget(game: GameLesson04()));
      case lesson05:
        return _buildRoute(MyGameWidget(game: GameLesson05()));
      case lesson06:
        return _buildRoute(MyGameWidget(game: GameLesson06()));
      case lesson07:
        return _buildRoute(MyGameWidget(game: GameLesson07()));
      case lesson08:
        return _buildRoute(MyGameWidget(game: GameLesson08()));
      case lesson09:
        return _buildRoute(MyGameWidget(game: GameLesson09()));
      default:
        throw Exception('Route does not exists');
    }
  }
}
