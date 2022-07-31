import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
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
import 'package:flutter_learn_flame/main.dart';

class LessonMenu extends StatelessWidget {
  const LessonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        child: ListView(
          children: [
            ButtonItem(
              title: '01- The world, bodies, figures and fixtures',
              game: GameLesson01(),
            ),
            ButtonItem(
              title: '02- Body types: dynamic, static & kinematic',
              game: GameLesson02(),
            ),
            ButtonItem(
              title: '03- Friction, density & restitution',
              game: GameLesson03(),
            ),
            ButtonItem(
              title: '04- Forces, impulses & linear velocity',
              game: GameLesson04(),
            ),
            ButtonItem(
              title: '05- Bodies and sprites',
              game: GameLesson05(),
            ),
            ButtonItem(
              title: '06- Collisions',
              game: GameLesson06(),
            ),
            ButtonItem(
              title: '07- Collisions with animated sprites',
              game: GameLesson07(),
            ),
            ButtonItem(
              title: '08- Animated sprites: walk, jump, duck',
              game: GameLesson08(),
            ),
            ButtonItem(
              title: '09- Camera xxxx',
              game: GameLesson09(),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonItem extends StatelessWidget {
  final String title;
  final Forge2DGame game;

  const ButtonItem({
    super.key,
    required this.title,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
          onPressed: () {
            currentLessonNotifier.value = GameWidget(game: game);
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
