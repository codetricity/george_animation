import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/world/my_george_game.dart';
import 'package:george/world/scene.dart';
import '../characters/friend_component.dart';

void loadFriends(
    TiledComponent homeMap, WorldScene worldScene, MyGeorgeGame game) {
  final friendGroup = homeMap.tileMap.getObjectGroupFromLayer('Friends');

  for (var friendBox in friendGroup.objects) {
    worldScene.add(FriendComponent(worldScene: worldScene, game: game)
      ..position = Vector2(friendBox.x, friendBox.y)
      ..width = friendBox.width
      ..height = friendBox.height
      ..debugMode = true);
  }
}
