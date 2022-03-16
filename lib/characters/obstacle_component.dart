import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/characters/george_component.dart';
import 'package:george/main.dart';

class ObstacleComponent extends PositionComponent with HasHitboxes, Collidable {
  final MyGeorgeGame game;
  ObstacleComponent({required this.game}) {
    addHitbox(HitboxRectangle());
  }
  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is GeorgeComponent) {
      game.collisionDirection = game.direction;
      print('collision with obstacle in direction: ${game.collisionDirection}');
    }
  }

  @override
  void onCollisionEnd(Collidable other) {
    if (other is GeorgeComponent) {
      game.collisionDirection = -1;
    }
  }
}
