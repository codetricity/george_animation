import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import 'package:george/world/scene.dart';
import '../world/my_george_game.dart';

class GeorgeComponent extends SpriteAnimationComponent
    with HasHitboxes, Collidable, HasGameRef<MyGeorgeGame> {
  final WorldScene worldScene;
  GeorgeComponent({required this.worldScene, required this.game}) {
    addHitbox(HitboxRectangle(relation: Vector2.all(0.4)));
  }

  final MyGeorgeGame game;
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
        image: await game.images.load('george2.png'), srcSize: Vector2(48, 48));

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
    if (!worldScene.showDialog) {
      switch (gameRef.direction) {
        case 0:
          animation = idleAnimation;
          break;
        case 1:
          animation = downAnimation;
          if (y < worldScene.mapHeight - height) {
            if (worldScene.collisionDirection != 1) {
              y += dt * gameRef.characterSpeed;
            }
          }
          break;
        case 2:
          animation = leftAnimation;
          if (x > 0) {
            if (worldScene.collisionDirection != 2) {
              x -= dt * gameRef.characterSpeed;
            }
          }

          break;
        case 3:
          animation = upAnimation;
          if (y > 0) {
            if (worldScene.collisionDirection != 3) {
              y -= dt * gameRef.characterSpeed;
            }
          }

          break;
        case 4:
          animation = rightAnimation;
          if (x < worldScene.mapWidth - width) {
            if (worldScene.collisionDirection != 4) {
              x += dt * gameRef.characterSpeed;
            }
          }
          break;
      }
    }
    super.update(dt);
  }
}
