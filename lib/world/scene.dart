import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/loaders/load_friends.dart';
import 'package:george/world/my_george_game.dart';

import '../characters/george_component.dart';
import '../loaders/add_baked_goods.dart';
import '../loaders/load_obstacles.dart';

class WorldScene extends Component {
  WorldScene({required this.mapFile, required this.game});
  final MyGeorgeGame game;
  final String mapFile;
  late TiledComponent mapInfo;
  late double mapWidth;
  late double mapHeight;
  late GeorgeComponent george;
  bool showDialog = true;

  // if collisionDirection is -1, there is no collision
  int collisionDirection = -1;

  String dialogMessage = 'Hi.  I am George.  I have just '
      'moved to Happy Bay Village. '
      'I want to make friends.';
  int friendNumber = 0;
  int bakedGoodsInventory = 0;
  String soundTrackName = 'ukulele';
  late AudioPool yummy;
  late AudioPool applause;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    mapInfo = await TiledComponent.load(mapFile, Vector2.all(16));

    add(mapInfo);
    george = GeorgeComponent(worldScene: this, game: game)
      ..position = Vector2(529, 128)
      ..debugMode = true
      ..size = Vector2.all(game.characterSize);

    add(george);
    mapWidth = mapInfo.tileMap.map.width * 16.0;
    mapHeight = mapInfo.tileMap.map.height * 16.0;

    // load characters and players
    addBakedGoods(mapInfo, this, game);
    loadFriends(mapInfo, this, game);
    loadObstacles(mapInfo, this);
    game.camera.followComponent(george,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
    yummy = await AudioPool.create('yummy.mp3');
    applause = await AudioPool.create('applause.mp3');
  }
}
