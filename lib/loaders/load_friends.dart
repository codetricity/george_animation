import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../characters/friend_component.dart';
import '../my_george_game.dart';

void loadFriends(TiledComponent homeMap, MyGeorgeGame game) {
  final friendGroup = homeMap.tileMap.getObjectGroupFromLayer('Friends');

  for (var friendBox in friendGroup.objects) {
    var friend = FriendComponent(game: game)
      ..position = Vector2(friendBox.x, friendBox.y)
      ..width = friendBox.width
      ..height = friendBox.height
      ..debugMode = true;
    game.componentList.add(friend);
    game.add(friend);
  }
}
