import 'package:flame/components.dart';
import 'package:flame_gdx_texture_packer/atlas/texture_atlas.dart';

class Assets {
  static late final Sprite button;
  static late final Sprite buttonPause;
  static late final Sprite buttonBack;

  static late final Sprite background;

  static late final Sprite heroFall;
  static late final Sprite heroJump;

  static late final Sprite cloudHappyEnemy;
  static late final Sprite cloudAngryEnemy;
  static late final SpriteAnimation hearthEnemy;
  static late final SpriteAnimation jetpackFire;
  static late final SpriteAnimation lightning;

  static late final Sprite coin;
  static late final Sprite gun;
  static late final Sprite bullet;
  static late final Sprite spring;
  static late final Sprite bubbleSmall;
  static late final Sprite jetpackSmall;
  static late final Sprite bubble;
  static late final Sprite jetpack;

  static late final Sprite platformBeige;
  static late final Sprite platformBeigeLight;
  static late final Sprite platformBeigeBroken;
  static late final Sprite platformBeigeLeft;
  static late final Sprite platformBeigeRight;
  static late final Sprite platformBlue;
  static late final Sprite platformBlueLight;
  static late final Sprite platformBlueBroken;
  static late final Sprite platformBlueLeft;
  static late final Sprite platformBlueRight;
  static late final Sprite platformGray;
  static late final Sprite platformGrayLight;
  static late final Sprite platformGrayBroken;
  static late final Sprite platformGrayLeft;
  static late final Sprite platformGrayRight;
  static late final Sprite platformGreen;
  static late final Sprite platformGreenLight;
  static late final Sprite platformGreenBroken;
  static late final Sprite platformGreenLeft;
  static late final Sprite platformGreenRight;
  static late final Sprite platformMulticolor;
  static late final Sprite platformMulticolorLight;
  static late final Sprite platformMulticolorBroken;
  static late final Sprite platformMulticolorLeft;
  static late final Sprite platformMulticolorRight;
  static late final Sprite platformPink;
  static late final Sprite platformPinkLight;
  static late final Sprite platformPinkBroken;
  static late final Sprite platformPinkLeft;
  static late final Sprite platformPinkRight;

  static Future<void> load() async {
    final atlas = await TextureAtlas().load('atlasMap.atlas');
    button = atlas.findSpriteByName('button')!;
    buttonPause = atlas.findSpriteByName('buttonPause')!;
    buttonBack = atlas.findSpriteByName('buttonBack')!;
    background = atlas.findSpriteByName('background')!;

    heroFall = atlas.findSpriteByName('heroFall')!;
    heroJump = atlas.findSpriteByName('heroJump')!;

    cloudHappyEnemy = atlas.findSpriteByName('HappyCloud')!;
    cloudAngryEnemy = atlas.findSpriteByName('AngryCloud')!;
    final enemy1 = atlas.findSpriteByName('HearthEnemy1')!;
    final enemy2 = atlas.findSpriteByName('HearthEnemy2')!;
    final lightning1 = atlas.findSpriteByName('Lightning1')!;
    final lightning2 = atlas.findSpriteByName('Lightning2')!;

    hearthEnemy = SpriteAnimation.spriteList([
      enemy1,
      enemy2,
    ], stepTime: 0.2, loop: true);

    lightning = SpriteAnimation.spriteList([
      lightning1,
      lightning2,
    ], stepTime: 0.15, loop: true);

    coin = atlas.findSpriteByName('Coin')!;
    gun = atlas.findSpriteByName('Pistol')!;
    bullet = atlas.findSpriteByName('Bullet')!;
    spring = atlas.findSpriteByName('Spring')!;
    bubbleSmall = atlas.findSpriteByName('Bubble_Small')!;
    jetpackSmall = atlas.findSpriteByName('Jetpack_Small')!;
    bubble = atlas.findSpriteByName('Bubble_Big')!;
    jetpack = atlas.findSpriteByName('Jetpack_Big')!;

    final jetpack1 = atlas.findSpriteByName('JetFire1')!;
    final jetpack2 = atlas.findSpriteByName('JetFire2')!;

    jetpackFire = SpriteAnimation.spriteList([
      jetpack1,
      jetpack2,
    ], stepTime: 0.15, loop: true);

    platformBeige = atlas.findSpriteByName('LandPiece_DarkBeige')!;
    platformBeigeLight = atlas.findSpriteByName('LandPiece_LightBeige')!;
    platformBeigeBroken = atlas.findSpriteByName('BrokenLandPiece_Beige')!;
    platformBeigeLeft = atlas.findSpriteByName('HalfLandPiece_Left_Beige')!;
    platformBeigeRight = atlas.findSpriteByName('HalfLandPiece_Right_Beige')!;

    platformBlue = atlas.findSpriteByName('LandPiece_DarkBlue')!;
    platformBlueLight = atlas.findSpriteByName('LandPiece_LightBlue')!;
    platformBlueBroken = atlas.findSpriteByName('BrokenLandPiece_Blue')!;
    platformBlueLeft = atlas.findSpriteByName('HalfLandPiece_Left_Blue')!;
    platformBlueRight = atlas.findSpriteByName('HalfLandPiece_Right_Blue')!;

    platformGray = atlas.findSpriteByName('LandPiece_DarkGray')!;
    platformGrayLight = atlas.findSpriteByName('LandPiece_LightGray')!;
    platformGrayBroken = atlas.findSpriteByName('BrokenLandPiece_Gray')!;
    platformGrayLeft = atlas.findSpriteByName('HalfLandPiece_Left_Gray')!;
    platformGrayRight = atlas.findSpriteByName('HalfLandPiece_Right_Gray')!;

    platformGreen = atlas.findSpriteByName('LandPiece_DarkGreen')!;
    platformGreenLight = atlas.findSpriteByName('LandPiece_LightGreen')!;
    platformGreenBroken = atlas.findSpriteByName('BrokenLandPiece_Green')!;
    platformGreenLeft = atlas.findSpriteByName('HalfLandPiece_Left_Green')!;
    platformGreenRight = atlas.findSpriteByName('HalfLandPiece_Right_Green')!;

    platformMulticolor = atlas.findSpriteByName('LandPiece_DarkMulticolored')!;
    platformMulticolorLight =
        atlas.findSpriteByName('LandPiece_LightMulticolored')!;
    platformMulticolorBroken =
        atlas.findSpriteByName('BrokenLandPiece_Multicolored')!;
    platformMulticolorLeft =
        atlas.findSpriteByName('HalfLandPiece_Left_Multicolored')!;
    platformMulticolorRight =
        atlas.findSpriteByName('HalfLandPiece_Right_Multicolored')!;

    platformPink = atlas.findSpriteByName('LandPiece_DarkPink')!;
    platformPinkLight = atlas.findSpriteByName('LandPiece_LightPink')!;
    platformPinkBroken = atlas.findSpriteByName('BrokenLandPiece_Pink')!;
    platformPinkLeft = atlas.findSpriteByName('HalfLandPiece_Left_Pink')!;
    platformPinkRight = atlas.findSpriteByName('HalfLandPiece_Right_Pink')!;
  }
}
