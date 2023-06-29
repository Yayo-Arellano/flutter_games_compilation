import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/ui/widgets/my_text.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton(
    this.text, {
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SpriteButton.future(
      sprite: Future.value(Assets.button),
      pressedSprite: Future.value(Assets.button),
      onPressed: onPressed,
      height: 50,
      width: 120,
      label: MyText(
        text,
        fontSize: 26,
      ),
    );
  }
}
