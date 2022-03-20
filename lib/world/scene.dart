import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/world/my_george_game.dart';

import '../characters/george_component.dart';
import '../loaders/add_baked_goods.dart';
import '../loaders/load_friends.dart';
import '../loaders/load_obstacles.dart';

class Scene extends Component {
  Scene({required this.game});
  final MyGeorgeGame game;
  late GeorgeComponent george;
  late double mapWidth;
  late double mapHeight;

  // direction of George
  // 0=idle, 1=down, 2= left, 3= up, 4=right
  int direction = 0;
  // if collisionDirection is -1, there is no collision
  int collisionDirection = -1;

  final double characterSize = 64;
  final double characterSpeed = 80;
  String soundTrackName = 'ukulele';
  int friendNumber = 0;
  int bakedGoodsInventory = 0;

  late AudioPool yummy;
  late AudioPool applause;
  bool showDialog = true;

  String dialogMessage = 'Hi.  I am George.  I have just '
      'moved to Happy Bay Village. '
      'I want to make friends.';

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final homeMap = await TiledComponent.load('map.tmx', Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16.0;
    mapHeight = homeMap.tileMap.map.height * 16.0;

    // load characters and players
    addBakedGoods(homeMap, this);
    loadFriends(homeMap: homeMap, scene: this);
    loadObstacles(homeMap: homeMap, scene: this);

    yummy = await AudioPool.create('yummy.mp3');
    applause = await AudioPool.create('applause.mp3');
    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.load('music.mp3');
    FlameAudio.bgm.play('music.mp3');
    game.overlays.add('ButtonController');

    george = GeorgeComponent(scene: this)
      ..position = Vector2(529, 128)
      ..debugMode = true
      ..size = Vector2.all(characterSize);

    add(george);

    game.camera.followComponent(george,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  @override
  void onTapUp(TapUpInfo info) {
    direction += 1;
    if (direction > 4) {
      direction = 0;
    }
  }
}
