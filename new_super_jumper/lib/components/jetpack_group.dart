import 'package:flame/components.dart';
import 'package:new_super_jumper/assets.dart';

class JetpackGroup extends PositionComponent {
  static Vector2 jetpackSize = Vector2(.40, .65);
  static Vector2 fireSize = Vector2(.36, .58);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    priority = 2;
    add(
      SpriteComponent(
        sprite: Assets.jetpack,
        size: jetpackSize,
        anchor: Anchor.center,
      ),
    );

    add(
      SpriteAnimationComponent(
        position: Vector2(0, .55),
        animation: Assets.jetpackFire.clone(),
        anchor: Anchor.center,
        size: fireSize,
      ),
    );
  }
}
