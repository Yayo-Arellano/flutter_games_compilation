import 'package:flutter/material.dart';
import 'package:flutter_learn_flame/lesson_menu.dart';

final currentLessonNotifier = ValueNotifier<Widget?>(null);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => currentLessonNotifier.value = null,
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: currentLessonNotifier,
          builder: (context, Widget? current, child) {
            return current ?? const LessonMenu();
          },
        ),
      ),
    ),
  );
}
