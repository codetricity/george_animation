import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/characters/george_component.dart';
import '../world/scene.dart';

class FriendComponent extends PositionComponent with HasHitboxes, Collidable {
  final Scene scene;
  FriendComponent({required this.scene}) {
    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is GeorgeComponent) {
      // var message = '';
      if (scene.bakedGoodsInventory > 0) {
        scene.dialogMessage = 'Wow.  Thanks so much.  Please come over '
            'this weekend for dinner.  I have to run now. '
            'See you on Saturday at 7pm.';

        scene.friendNumber++;
        scene.bakedGoodsInventory--;
        scene.applause.start();
      } else {
        scene.dialogMessage =
            'Great to meet you.  Sorry, I have to run to a meeting.';
      }
      // game.dialogBox = DialogBox(text: message, game: game);
      // game.add(game.dialogBox);
      scene.showDialog = true;
      scene.game.overlays.notifyListeners();

      remove(this);
    }

    super.onCollision(intersectionPoints, other);
  }
}
