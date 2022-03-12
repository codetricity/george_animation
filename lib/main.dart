import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:george/characters/baked_good.dart';
import 'button_controller.dart';
import 'characters/friend_component.dart';
import 'characters/george_component.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  runApp(MaterialApp(
    home: Scaffold(
      body: GameWidget(
        game: MyGeorgeGame(),
        overlayBuilderMap: {
          'ButtonController': (BuildContext context, MyGeorgeGame game) {
            return ButtonController(
              game: game,
            );
          }
        },
      ),
    ),
  ));
}

class MyGeorgeGame extends FlameGame with TapDetector, HasCollidables {
  late GeorgeComponent george;
  late double mapWidth;
  late double mapHeight;

  // 0=idle, 1=down, 2= left, 3= up, 4=right
  int direction = 0;
  final double characterSize = 100;
  final double characterSpeed = 80;
  String soundTrackName = 'ukulele';
  int friendNumber = 0;
  int bakedGoodsInventory = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    TiledComponent homeMap =
        await TiledComponent.load('map.tmx', Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16.0;
    mapHeight = homeMap.tileMap.map.height * 16.0;

    final friendGroup = homeMap.tileMap.getObjectGroupFromLayer('Friends');

    for (var friendBox in friendGroup.objects) {
      add(FriendComponent(game: this)
        ..position = Vector2(friendBox.x, friendBox.y)
        ..width = friendBox.width
        ..height = friendBox.height
        ..debugMode = true);
    }

    addBakedGoods(homeMap);

    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.load('music.mp3');
    FlameAudio.bgm.play('music.mp3');
    overlays.add('ButtonController');

    george = GeorgeComponent()
      ..position = Vector2(100, 200)
      ..debugMode = true
      ..size = Vector2.all(characterSize);

    add(george);

    camera.followComponent(george,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // 0=idle, 1=down, 2= left, 3= up, 4=right
  }

  @override
  void onTapUp(TapUpInfo info) {
    direction += 1;
    if (direction > 4) {
      direction = 0;
    }
  }

  void addBakedGoods(TiledComponent homeMap) async {
    var bakedGoods = homeMap.tileMap.getObjectGroupFromLayer('BakedGoods');
    for (var bakedGood in bakedGoods.objects) {
      switch (bakedGood.type) {
        case 'ApplePie':
          Sprite sprite = await loadSprite('apple_pie.png');
          add(BakedGood()
            ..sprite = sprite
            ..size = Vector2(bakedGood.width, bakedGood.height)
            ..position = Vector2(bakedGood.x, bakedGood.y));
          break;
        case 'Cookie':
          Sprite sprite = await loadSprite('cookies.png');
          print('adding cookie');
          add(BakedGood()
            ..sprite = sprite
            ..size = Vector2(bakedGood.width, bakedGood.height)
            ..position = Vector2(bakedGood.x, bakedGood.y));
          break;
        case 'CheeseCake':
          Sprite sprite = await loadSprite('cheesecake.png');
          print('adding cheesecake');
          add(BakedGood()
            ..sprite = sprite
            ..size = Vector2(bakedGood.width, bakedGood.height)
            ..position = Vector2(bakedGood.x, bakedGood.y));
          break;
        case 'ChocoCake':
          Sprite sprite = await loadSprite('choco_cake.png');
          print('adding chocolate cake');
          add(BakedGood()
            ..sprite = sprite
            ..size = Vector2(bakedGood.width, bakedGood.height)
            ..position = Vector2(bakedGood.x, bakedGood.y));
          break;
      }
    }
  }
}
