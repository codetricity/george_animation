import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/characters/george_component.dart';
import 'package:george/main.dart';
import 'package:george/world/scene.dart';

import '../world/my_george_game.dart';

class ObstacleComponent extends PositionComponent
    with HasHitboxes, Collidable, HasGameRef<MyGeorgeGame> {
  final WorldScene worldScene;
  bool _hasCollided = false;
  ObstacleComponent({required this.worldScene}) {
    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);

    if (other is GeorgeComponent) {
      if (!_hasCollided) {
        worldScene.collisionDirection = gameRef.direction;
        _hasCollided = true;
        print(
            'collision with obstacle in direction: ${worldScene.collisionDirection}');
      }
    }
  }

  @override
  void onCollisionEnd(Collidable other) {
    if (other is GeorgeComponent) {
      worldScene.collisionDirection = -1;
      _hasCollided = false;
    }
  }
}
