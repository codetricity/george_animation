import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import '../my_george_game.dart';

class GemComponent extends SpriteComponent
    with HasHitboxes, Collidable, HasGameRef<MyGeorgeGame> {
  GemComponent() {
    debugMode = true;
    addHitbox(HitboxRectangle(relation: Vector2.all(0.5)));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    gameRef.gemInventory++;
    gameRef.yummy.start();
    gameRef.overlays.notifyListeners();
    print('gem inventory: ${gameRef.gemInventory}');
    gameRef.remove(this);
  }
}
