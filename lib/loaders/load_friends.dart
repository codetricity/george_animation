import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../characters/friend_component.dart';
import '../world/scene.dart';

void loadFriends({required TiledComponent homeMap, required Scene scene}) {
  final friendGroup = homeMap.tileMap.getObjectGroupFromLayer('Friends');

  for (var friendBox in friendGroup.objects) {
    scene.add(FriendComponent(scene: scene)
      ..position = Vector2(friendBox.x, friendBox.y)
      ..width = friendBox.width
      ..height = friendBox.height
      ..debugMode = true);
  }
}
