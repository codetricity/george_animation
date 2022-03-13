import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/main.dart';

class BakedGoodComponent extends SpriteComponent
    with HasHitboxes, Collidable, HasGameRef<MyGeorgeGame> {
  BakedGoodComponent() {
    debugMode = true;
    addHitbox(HitboxRectangle(relation: Vector2.all(0.5)));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    gameRef.bakedGoodsInventory++;
    gameRef.overlays.notifyListeners();
    print('baked goods inventory: ${gameRef.bakedGoodsInventory}');
    gameRef.yummy.start();
    gameRef.remove(this);
  }
}
