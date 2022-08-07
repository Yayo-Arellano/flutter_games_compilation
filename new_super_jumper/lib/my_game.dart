import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/high_scores.dart';
import 'package:new_super_jumper/objects/bullet.dart';
import 'package:new_super_jumper/objects/cloud_enemy.dart';
import 'package:new_super_jumper/objects/coin.dart';
import 'package:new_super_jumper/objects/floor.dart';
import 'package:new_super_jumper/objects/hearth_enemy.dart';
import 'package:new_super_jumper/objects/hero.dart';
import 'package:new_super_jumper/objects/platform.dart';
import 'package:new_super_jumper/objects/platform_pieces.dart';
import 'package:new_super_jumper/objects/power_up.dart';
import 'package:new_super_jumper/ui/game_ui.dart';

final screenSize = Vector2(428, 926);
final worldSize = Vector2(4.28, 9.26);

final random = Random();

enum GameState {
  running,
  gameOver,
}

class MyGame extends Forge2DGame
    with
        HasKeyboardHandlerComponents,
        HasTappableComponents,
        HasTappablesBridge {
  late final MyHero hero;

  int score = 0;
  int coins = 0;
  int bullets = 0;
  double generatedWorldHeight = 6.7;

  var state = GameState.running;

  // Scale the screenSize by 100 and set the gravity of 15
  MyGame() : super(zoom: 100, gravity: Vector2(0, 9.8));

  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(screenSize);

    final background = SpriteComponent(
      sprite: Assets.background,
      size: screenSize,
    )..positionType = PositionType.viewport;

    // Adds a black background to the viewport
    add(background);

    add(GameUI());

    add(Floor());
    hero = MyHero();

    // generateNextSectionOfWorld();

    await add(hero);

    final worldBounds =
        Rect.fromLTRB(0, -double.infinity, worldSize.x, worldSize.y);
    camera.followBodyComponent(hero, worldBounds: worldBounds);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (state == GameState.running) {
      if (generatedWorldHeight > hero.body.position.y - worldSize.y / 2) {
        generateNextSectionOfWorld();
      }
      final heroY = (hero.body.position.y - worldSize.y) * -1;

      if (score < heroY) {
        score = heroY.toInt();
      }

      if (score - 7 > heroY) {
        hero.hit();
      }

      if (hero.state == HeroState.dead && (score - worldSize.y) > heroY) {
        state = GameState.gameOver;
        HighScores.saveNewScore(score);
        overlays.add('GameOverMenu');
      }
    }
  }

  bool isOutOfScreen(Vector2 position) {
    final heroY = (hero.body.position.y - worldSize.y) * -1;
    final otherY = (position.y - worldSize.y) * -1;

    return otherY < heroY - worldSize.y / 2;

    // final heroPosY = (hero.body.position.y - worldSize.y).abs();
    // final otherPosY = (position.y - worldSize.y).abs();
    // return otherPosY < heroPosY - worldSize.y / 2;
  }

  void generateNextSectionOfWorld() {
    for (int i = 0; i < 10; i++) {
      add(Platform(
        x: worldSize.x * random.nextDouble(),
        y: generatedWorldHeight,
      ));
      add(Platform(
        x: worldSize.x * random.nextDouble(),
        y: generatedWorldHeight,
      ));

      if (random.nextBool()) {
        add(HearthEnemy(
          x: worldSize.x * random.nextDouble(),
          y: generatedWorldHeight - 1.5,
        ));
      } else if (random.nextDouble() < .2) {
        add(CloudEnemy(
          x: worldSize.x * random.nextDouble(),
          y: generatedWorldHeight - 1.5,
        ));
      }

      if (random.nextDouble() < .3) {
        add(PowerUp(
          x: worldSize.x * random.nextDouble(),
          y: generatedWorldHeight - 1.5,
        ));
        if (random.nextDouble() < .2) {
          addCoins();
        }
      }

      generatedWorldHeight -= 2.7;
    }
  }

  void addBrokenPlatformPieces(Platform platform) {
    final x = platform.body.position.x;
    final y = platform.body.position.y;

    final leftSide = PlatformPieces(
      x: x - (PlatformPieces.size.x / 2),
      y: y,
      isLeftSide: true,
      type: platform.type,
    );

    final rightSide = PlatformPieces(
      x: x + (PlatformPieces.size.x / 2),
      y: y,
      isLeftSide: false,
      type: platform.type,
    );

    add(leftSide);
    add(rightSide);
  }

  void addCoins() {
    final rows = random.nextInt(15) + 1;
    final cols = random.nextInt(5) + 1;

    final x = (worldSize.x - (Coin.size.x * cols)) * random.nextDouble() +
        Coin.size.x / 2;

    for (int col = 0; col < cols; col++) {
      for (int row = 0; row <= rows; row++) {
        add(Coin(
          x: x + (col * Coin.size.x),
          y: generatedWorldHeight + (row * Coin.size.y) - 2,
        ));
      }
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    hero.fireBullet();
  }

  void addBullets() {
    bullets -= 3;
    if (bullets < 0) bullets = 0;
    if (bullets == 0) return;
    final x = hero.body.position.x;
    final y = hero.body.position.y;

    add(Bullet(x: x, y: y, accelX: -1.5));
    add(Bullet(x: x, y: y, accelX: 0));
    add(Bullet(x: x, y: y, accelX: 1.5));
  }
}
