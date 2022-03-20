import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/characters/george_component.dart';
import 'package:george/main.dart';

import '../world/scene.dart';

class ObstacleComponent extends PositionComponent with HasHitboxes, Collidable {
  final Scene scene;
  bool _hasCollided = false;
  ObstacleComponent({required this.scene}) {
    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);

    if (other is GeorgeComponent) {
      if (!_hasCollided) {
        scene.collisionDirection = scene.direction;
        _hasCollided = true;
        print(
            'collision with obstacle in direction: ${scene.collisionDirection}');
      }
    }
  }

  @override
  void onCollisionEnd(Collidable other) {
    if (other is GeorgeComponent) {
      scene.collisionDirection = -1;
      _hasCollided = false;
    }
  }
}
