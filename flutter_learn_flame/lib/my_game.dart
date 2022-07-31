import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn_flame/main.dart';
import 'package:flutter_learn_flame/utils/constants.dart';

final screenSize = Vector2(1280, 720);
final worldSize = Vector2(12.8, 7.2);

class MyGame extends Forge2DGame with KeyboardEvents {
  final totalBodies = TextComponent()
    ..positionType = PositionType.viewport
    ..x = 5
    ..y = 690;

  MyGame() : super(zoom: 100, gravity: Vector2(0, 15));

  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(screenSize);
    add(_Background(size: screenSize) ..positionType = PositionType.viewport);
    add(FpsTextComponent()
      ..x = 5
      ..y = 665);
    add(totalBodies);

    print('Camera: canvasSize: ${camera.canvasSize}');
    print('Camera: viewport.effectiveSize ${camera.viewport.effectiveSize}');
    print('Camera: gameSize ${camera.gameSize}');

    final worldX = screenToWorld(camera.viewport.effectiveSize);

    print('worldSize ${worldX}');
  }

  @override
  void update(double dt) {
    super.update(dt);
    totalBodies.text = 'Bodies: ${world.bodies.length}';
  }

  @override
  KeyEventResult onKeyEvent(RawKeyEvent event, Set keysPressed) {
    if (event is RawKeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.escape)) {
        currentLessonNotifier.value = null;
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  Color backgroundColor() {
    return Colors.red;
  }
}

class _Background extends PositionComponent {
  _Background({super.size});

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), blackPaint);
  }
}
