import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/image_composition.dart';
import 'package:george/main.dart';

class BakedGood extends SpriteComponent
    with HasHitboxes, Collidable, HasGameRef<MyGeorgeGame> {
  BakedGood() {
    debugMode = true;
    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    gameRef.bakedGoodsInventory++;
    print('baked good inventory: ${gameRef.bakedGoodsInventory}');
    gameRef.remove(this);

    super.onCollision(intersectionPoints, other);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
