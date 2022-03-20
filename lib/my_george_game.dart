import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'characters/george_component.dart';
import 'loaders/add_baked_goods.dart';
import 'loaders/load_friends.dart';
import 'loaders/load_obstacles.dart';

class MyGeorgeGame extends FlameGame with TapDetector, HasCollidables {
  final double characterSize = 64;
  final double characterSpeed = 80;
  final maxScenes = 3;

  late GeorgeComponent george;
  late double mapWidth;
  late double mapHeight;

  // direction of George
  // 0=idle, 1=down, 2= left, 3= up, 4=right
  int direction = 0;
  // if collisionDirection is -1, there is no collision
  int collisionDirection = -1;

  String soundTrackName = 'ukulele';
  int friendNumber = 0;
  int maxFriends = 0;
  int bakedGoodsInventory = 0;

  late AudioPool yummy;
  late AudioPool applause;
  // late DialogBox dialogBox;
  bool showDialog = true;

  String dialogMessage = 'Hi.  I am George.  I have just '
      'moved to Happy Bay Village. '
      'I want to make friends.';
  late TiledComponent homeMap;
  List<Component> componentList = [];
  int sceneNumber = 1;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    homeMap = await TiledComponent.load('map.tmx', Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16.0;
    mapHeight = homeMap.tileMap.map.height * 16.0;

    // load characters and players
    addBakedGoods(homeMap, this);
    loadFriends(homeMap, this);
    loadObstacles(homeMap, this);

    yummy = await AudioPool.create('yummy.mp3');
    applause = await AudioPool.create('applause.mp3');

    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.load('music.mp3');
    FlameAudio.bgm.play('music.mp3');
    overlays.add('ButtonController');

    george = GeorgeComponent(game: this)
      ..position = Vector2(529, 128)
      ..debugMode = true
      ..size = Vector2.all(characterSize);

    add(george);

    camera.followComponent(george,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  @override
  void onTapUp(TapUpInfo info) {
    direction += 1;
    if (direction > 4) {
      direction = 0;
    }
  }

  void newScene() async {
    String mapFile = 'map.tmx';
    remove(homeMap);
    bakedGoodsInventory = 0;
    friendNumber = 0;
    maxFriends = 0;
    FlameAudio.bgm.stop();
    removeAll(componentList);
    componentList = [];
    showDialog = false;
    remove(george);
    george = GeorgeComponent(game: this)
      ..position = Vector2(529, 128)
      ..debugMode = true
      ..size = Vector2.all(characterSize);

    if (sceneNumber == 2) {
      mapFile = 'happy_map.tmx';
    }

    homeMap = await TiledComponent.load(mapFile, Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16.0;
    mapHeight = homeMap.tileMap.map.height * 16.0;
    // load characters and players
    addBakedGoods(homeMap, this);
    loadFriends(homeMap, this);
    loadObstacles(homeMap, this);

    add(george);

    camera.followComponent(george,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }
}
