import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/characters/george_component.dart';
import '../my_george_game.dart';

class GemComponent extends SpriteComponent with HasHitboxes, Collidable {
  final MyGeorgeGame game;
  GemComponent({required this.game}) {
    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is GeorgeComponent) {
      game.gemInventory++;
      game.applause.start();
    }
    game.remove(this);
    super.onCollision(intersectionPoints, other);
  }
}
