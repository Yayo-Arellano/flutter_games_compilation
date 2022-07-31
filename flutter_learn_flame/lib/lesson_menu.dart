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
                title: '01- The world, bodies, figures and fixtures',
                route: Routes.lesson01,
              ),
              ButtonItem(
                title: '02- Body types: dynamic, static & kinematic',
                route: Routes.lesson02,
              ),
              ButtonItem(
                title: '03- Friction, density & restitution',
                route: Routes.lesson03,
              ),
              ButtonItem(
                title: '04- Forces, impulses & linear velocity',
                route: Routes.lesson04,
              ),
              ButtonItem(
                title: '05- Bodies and sprites',
                route: Routes.lesson05,
              ),
              ButtonItem(
                title: '06- Collisions',
                route: Routes.lesson06,
              ),
              ButtonItem(
                title: '07- Collisions with animated sprites',
                route: Routes.lesson07,
              ),
              ButtonItem(
                title: '08- Animated sprites: walk, jump, duck',
                route: Routes.lesson08,
              ),
              ButtonItem(
                title: '09- Camera xxxx',
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
