import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import '../world/scene.dart';

class BakedGoodComponent extends SpriteComponent with HasHitboxes, Collidable {
  BakedGoodComponent({required this.scene}) {
    debugMode = true;
    addHitbox(HitboxRectangle(relation: Vector2.all(0.5)));
  }

  final Scene scene;

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    scene.bakedGoodsInventory++;
    scene.yummy.start();
    scene.game.overlays.notifyListeners();
    print('baked goods inventory: ${scene.bakedGoodsInventory}');
    scene.remove(this);
  }
}
