import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/dialog/dialog_box.dart';
import 'package:george/main.dart';

class FriendComponent extends PositionComponent with HasHitboxes, Collidable {
  final MyGeorgeGame game;
  FriendComponent({required this.game}) {
    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    var message = '';
    if (game.bakedGoodsInventory > 0) {
      game.dialogMessage = 'Wow.  Thanks so much.  Please come over '
          'this weekend for dinner.  I have to run now. '
          'See you on Saturday at 7pm.';

      game.friendNumber++;
      game.bakedGoodsInventory--;
      game.applause.start();
    } else {
      game.dialogMessage =
          'Great to meet you.  Sorry, I have to run to a meeting.';
    }
    // game.dialogBox = DialogBox(text: message, game: game);
    // game.add(game.dialogBox);
    game.showDialog = true;
    game.overlays.notifyListeners();

    remove(this);

    super.onCollision(intersectionPoints, other);
  }
}
