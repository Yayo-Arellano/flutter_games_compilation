import 'package:flutter/material.dart';
import 'package:flutter_learn_flame/routes.dart';

class LessonMenu extends StatelessWidget {
  const LessonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: SizedBox(
          width: 350,
          child: ListView(
            children: const [
              SizedBox(height: 32),
              ButtonItem(
                title: 'The world, bodies, shapes and fixtures',
                route: Routes.lesson01,
              ),
              ButtonItem(
                title: 'Body types: dynamic, static & kinematic',
                route: Routes.lesson02,
              ),
              ButtonItem(
                title: 'Friction, density & restitution',
                route: Routes.lesson03,
              ),
              ButtonItem(
                title: 'Forces, impulses & linear velocity',
                route: Routes.lesson04,
              ),
              ButtonItem(
                title: 'Bodies and sprites',
                route: Routes.lesson05,
              ),
              ButtonItem(
                title: 'Collisions',
                route: Routes.lesson06,
              ),
              ButtonItem(
                title: 'Collisions with animated sprites',
                route: Routes.lesson07,
              ),
              ButtonItem(
                title: 'Animated sprites: walk, jump, duck',
                route: Routes.lesson08,
              ),
              ButtonItem(
                title: 'Camera',
                route: Routes.lesson09,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonItem extends StatelessWidget {
  final String title;
  final String route;

  const ButtonItem({
    super.key,
    required this.title,
    required this.route,
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
            Navigator.of(context).pushNamed(route);
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
