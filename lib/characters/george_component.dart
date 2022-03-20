import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import '../world/scene.dart';

class GeorgeComponent extends SpriteAnimationComponent
    with HasHitboxes, Collidable, HasGameRef {
  final Scene scene;
  GeorgeComponent({required this.scene}) {
    addHitbox(HitboxRectangle(relation: Vector2.all(0.4)));
  }
  late SpriteAnimation downAnimation;
  late SpriteAnimation leftAnimation;
  late SpriteAnimation rightAnimation;
  late SpriteAnimation upAnimation;
  late SpriteAnimation idleAnimation;
  final double animationSpeed = .1;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final spriteSheet = SpriteSheet(
        image: await gameRef.images.load('george2.png'),
        srcSize: Vector2(48, 48));

    // new
    downAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, to: 4);
    leftAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: animationSpeed, to: 4);
    upAnimation =
        spriteSheet.createAnimation(row: 2, stepTime: animationSpeed, to: 4);
    rightAnimation =
        spriteSheet.createAnimation(row: 3, stepTime: animationSpeed, to: 4);
    idleAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, to: 1);
    animation = idleAnimation;
  }

  @override
  void update(double dt) {
    if (!scene.showDialog) {
      switch (scene.direction) {
        case 0:
          animation = idleAnimation;
          break;
        case 1:
          animation = downAnimation;
          if (y < scene.mapHeight - height) {
            if (scene.collisionDirection != 1) {
              y += dt * scene.characterSpeed;
            }
          }
          break;
        case 2:
          animation = leftAnimation;
          if (x > 0) {
            if (scene.collisionDirection != 2) {
              x -= dt * scene.characterSpeed;
            }
          }

          break;
        case 3:
          animation = upAnimation;
          if (y > 0) {
            if (scene.collisionDirection != 3) {
              y -= dt * scene.characterSpeed;
            }
          }

          break;
        case 4:
          animation = rightAnimation;
          if (x < scene.mapWidth - width) {
            if (scene.collisionDirection != 4) {
              x += dt * scene.characterSpeed;
            }
          }
          break;
      }
    }
    super.update(dt);
  }
}
