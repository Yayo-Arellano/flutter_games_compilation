import 'package:flame/components.dart';
import 'package:new_super_jumper/assets.dart';

class Background extends SpriteComponent {
  Background() : super(sprite: Assets.background);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = findGame()!.camera.viewport.size;
  }

  @override
  void update(double dt) {
    super.update(dt);
    size = findGame()!.camera.viewport.size;
  }
}
