import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/characters/george_component.dart';
import 'package:george/main.dart';

import '../my_george_game.dart';

class ObstacleComponent extends PositionComponent with HasHitboxes, Collidable {
  final MyGeorgeGame game;
  bool _hasCollided = false;
  ObstacleComponent({required this.game}) {
    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);

    if (other is GeorgeComponent) {
      if (!_hasCollided) {
        game.collisionDirection = game.direction;
        _hasCollided = true;
        print(
            'collision with obstacle in direction: ${game.collisionDirection}');
      }
    }
  }

  @override
  void onCollisionEnd(Collidable other) {
    if (other is GeorgeComponent) {
      game.collisionDirection = -1;
      _hasCollided = false;
    }
  }
}
