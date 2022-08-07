import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/my_game.dart';
import 'package:new_super_jumper/utils.dart';

final textPaint = TextPaint(
  style: const TextStyle(
    color: Colors.black,
    fontSize: 35,
    fontWeight: FontWeight.w800,
    fontFamily: 'DaveysDoodleface',
  ),
);

class GameUI extends PositionComponent with HasGameRef<MyGame>{
  // Keep track of the number of bodies in the world.
  final totalBodies =
      TextComponent(position: Vector2(5, 895), textRenderer: textPaint);

  final totalScore = TextComponent(textRenderer: textPaint);

  final totalCoins = TextComponent(textRenderer: textPaint);

  final totalBullets = TextComponent(textRenderer: textPaint);

  final coin = SpriteComponent(sprite: Assets.coin, size: Vector2.all(25));
  final gun = SpriteComponent(sprite: Assets.gun, size: Vector2.all(35));

  // Keep track of the frames per second
  final fps =
      FpsTextComponent(position: Vector2(5, 870), textRenderer: textPaint);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    positionType = PositionType.viewport;
    position.y = isIOS ? 25 : 0;
    priority = 3;

    final btPause = SpriteButtonComponent(
        button: Assets.buttonPause,
        size: Vector2(35, 35),
        position: Vector2(390, 40),
        onPressed: () {
          findGame()?.overlays.add('PauseMenu');
          findGame()?.paused = true;
        })
      ..positionType = PositionType.viewport;

    add(btPause);
    add(coin);
    add(gun);
    add(fps);
    add(totalBodies);
    add(totalScore);
    add(totalCoins);
    add(totalBullets);
  }

  @override
  void update(double dt) {
    super.update(dt);

    totalBodies.text = 'Bodies: ${gameRef.world.bodies.length}';
    totalScore.text = 'Score ${gameRef.score}';
    totalCoins.text = 'x${gameRef.coins}';
    totalBullets.text = 'x${gameRef.bullets}';

    final posX = screenSize.x - totalCoins.size.x;
    totalCoins.position
      ..x = posX - 5
      ..y = 5;
    coin.position
      ..x = posX - 35
      ..y = 12;

    gun.position
      ..x = 5
      ..y = 12;
    totalBullets.position
      ..x = 40
      ..y = 8;

    totalScore.position
      ..x = screenSize.x / 2 - totalScore.size.x / 2
      ..y = 5;
  }
}
