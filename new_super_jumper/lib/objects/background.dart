import 'package:flame/components.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/my_game.dart';

class Background extends SpriteComponent {
  Background() : super(sprite: Assets.background);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = screenSize;
  }
}
