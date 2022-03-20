import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/world/scene.dart';
import '../world/my_george_game.dart';

class BakedGoodComponent extends SpriteComponent with HasHitboxes, Collidable {
  BakedGoodComponent({required this.worldScene, required this.game}) {
    debugMode = true;
    addHitbox(HitboxRectangle(relation: Vector2.all(0.5)));
  }

  final WorldScene worldScene;
  final MyGeorgeGame game;

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    worldScene.bakedGoodsInventory++;
    worldScene.yummy.start();
    game.overlays.notifyListeners();
    print('baked goods inventory: ${worldScene.bakedGoodsInventory}');
    game.remove(this);
  }
}
