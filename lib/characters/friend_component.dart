import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/characters/george_component.dart';
import 'package:george/world/my_george_game.dart';
import 'package:george/world/scene.dart';

class FriendComponent extends PositionComponent with HasHitboxes, Collidable {
  final WorldScene worldScene;
  FriendComponent({required this.worldScene, required this.game}) {
    addHitbox(HitboxRectangle());
  }

  final MyGeorgeGame game;

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is GeorgeComponent) {
      // var message = '';
      if (worldScene.bakedGoodsInventory > 0) {
        worldScene.dialogMessage = 'Wow.  Thanks so much.  Please come over '
            'this weekend for dinner.  I have to run now. '
            'See you on Saturday at 7pm.';

        worldScene.friendNumber++;
        worldScene.bakedGoodsInventory--;
        worldScene.applause.start();
      } else {
        worldScene.dialogMessage =
            'Great to meet you.  Sorry, I have to run to a meeting.';
      }
      // game.dialogBox = DialogBox(text: message, game: game);
      // game.add(game.dialogBox);
      worldScene.showDialog = true;
      game.overlays.notifyListeners();

      remove(this);
    }

    super.onCollision(intersectionPoints, other);
  }
}
