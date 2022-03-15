import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/main.dart';

import '../characters/friend_component.dart';

void addFriends(TiledComponent homeMap, MyGeorgeGame game) {
  final friendGroup = homeMap.tileMap.getObjectGroupFromLayer('Friends');

  for (var friendBox in friendGroup.objects) {
    game.add(FriendComponent(game: game)
      ..position = Vector2(friendBox.x, friendBox.y)
      ..width = friendBox.width
      ..height = friendBox.height
      ..debugMode = true);
  }
}
