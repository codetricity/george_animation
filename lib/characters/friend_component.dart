import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/main.dart';

class FriendComponent extends PositionComponent with HasHitboxes, Collidable {
  final MyGeorgeGame game;
  FriendComponent({required this.game}) {
    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    print('I made a new friend!');
    game.friendNumber++;
    game.applause.start();
    game.overlays.notifyListeners();
    remove(this);
    super.onCollision(intersectionPoints, other);
  }
}
