import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Assets {
  static late final Sprite button;
  static late final Sprite buttonPause;

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
    button = await _loadSprite('ui/button.png');
    buttonPause = await _loadSprite('ui/buttonPause.png');
    background = await _loadSprite('background.png');

    heroFall = await _loadSprite('heroFall.png');
    heroJump = await _loadSprite('heroJump.png');

    cloudHappyEnemy = await _loadSprite('HappyCloud.png');
    cloudAngryEnemy = await _loadSprite('AngryCloud.png');
    final enemy1 = await _loadSprite('HearthEnemy1.png');
    final enemy2 = await _loadSprite('HearthEnemy2.png');
    final lightning1 = await _loadItem('Lightning1');
    final lightning2 = await _loadItem('Lightning2');

    hearthEnemy = SpriteAnimation.spriteList([
      enemy1,
      enemy2,
    ], stepTime: 0.2, loop: true);

    lightning = SpriteAnimation.spriteList([
      lightning1,
      lightning2,
    ], stepTime: 0.15, loop: true);

    coin = await _loadItem('Coin');
    gun = await _loadItem('Pistol');
    bullet = await _loadItem('Bullet');
    spring = await _loadItem('Spring');
    bubbleSmall = await _loadItem('Bubble_Small');
    jetpackSmall = await _loadItem('Jetpack_Small');
    bubble = await _loadItem('Bubble_Big');
    jetpack = await _loadItem('Jetpack_Big');

    final jetpack1 = await _loadItem('JetFire1');
    final jetpack2 = await _loadItem('JetFire2');

    jetpackFire = SpriteAnimation.spriteList([
      jetpack1,
      jetpack2,
    ], stepTime: 0.15, loop: true);

    platformBeige = await _loadPlatform('LandPiece_DarkBeige');
    platformBeigeLight = await _loadPlatform('LandPiece_LightBeige');
    platformBeigeBroken = await _loadPlatform('BrokenLandPiece_Beige');
    platformBeigeLeft = await _loadPlatform('HalfLandPiece_Left_Beige');
    platformBeigeRight = await _loadPlatform('HalfLandPiece_Right_Beige');

    platformBlue = await _loadPlatform('LandPiece_DarkBlue');
    platformBlueLight = await _loadPlatform('LandPiece_LightBlue');
    platformBlueBroken = await _loadPlatform('BrokenLandPiece_Blue');
    platformBlueLeft = await _loadPlatform('HalfLandPiece_Left_Blue');
    platformBlueRight = await _loadPlatform('HalfLandPiece_Right_Blue');

    platformGray = await _loadPlatform('LandPiece_DarkGray');
    platformGrayLight = await _loadPlatform('LandPiece_LightGray');
    platformGrayBroken = await _loadPlatform('BrokenLandPiece_Gray');
    platformGrayLeft = await _loadPlatform('HalfLandPiece_Left_Gray');
    platformGrayRight = await _loadPlatform('HalfLandPiece_Right_Gray');

    platformGreen = await _loadPlatform('LandPiece_DarkGreen');
    platformGreenLight = await _loadPlatform('LandPiece_LightGreen');
    platformGreenBroken = await _loadPlatform('BrokenLandPiece_Green');
    platformGreenLeft = await _loadPlatform('HalfLandPiece_Left_Green');
    platformGreenRight = await _loadPlatform('HalfLandPiece_Right_Green');

    platformMulticolor = await _loadPlatform('LandPiece_DarkMulticolored');
    platformMulticolorLight = await _loadPlatform('LandPiece_LightMulticolored');
    platformMulticolorBroken = await _loadPlatform('BrokenLandPiece_Multicolored');
    platformMulticolorLeft = await _loadPlatform('HalfLandPiece_Left_Multicolored');
    platformMulticolorRight = await _loadPlatform('HalfLandPiece_Right_Multicolored');

    platformPink = await _loadPlatform('LandPiece_DarkPink');
    platformPinkLight = await _loadPlatform('LandPiece_LightPink');
    platformPinkBroken = await _loadPlatform('BrokenLandPiece_Pink');
    platformPinkLeft = await _loadPlatform('HalfLandPiece_Left_Pink');
    platformPinkRight = await _loadPlatform('HalfLandPiece_Right_Pink');
  }

  static Future<Sprite> _loadPlatform(String name) {
    return _loadSprite('platforms/$name.png');
  }

  static Future<Sprite> _loadItem(String name) {
    return _loadSprite('items/$name.png');
  }

  static Future<Sprite> _loadSprite(String name) async {
    return Sprite(await Flame.images.load(name));
  }
}
