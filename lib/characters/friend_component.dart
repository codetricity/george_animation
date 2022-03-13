import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/main.dart';

import '../dialog/dialog_box.dart';

class FriendComponent extends PositionComponent with HasHitboxes, Collidable {
  final MyGeorgeGame game;
  FriendComponent({required this.game}) {
    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (game.bakedGoodsInventory > 0) {
      game.dialogBox = DialogBox(
          text: 'Thanks so much for this. '
              'Please come to my house for dinner. '
              'I want to be your friend.',
          game: game);
      game.add(game.dialogBox);
      game.friendNumber++;
      game.bakedGoodsInventory--;
      game.overlays.notifyListeners();
      game.applause.start();
      remove(this);
    } else {
      game.dialogBox = DialogBox(
          text: 'hi, nice to meet you. Welcome to the neighborhood.',
          game: game);
      game.add(game.dialogBox);
      remove(this);
    }

    super.onCollision(intersectionPoints, other);
  }
}
