import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import '../my_george_game.dart';

class GeorgeComponent extends SpriteAnimationComponent
    with HasHitboxes, Collidable, HasGameRef {
  final MyGeorgeGame game;
  GeorgeComponent({required this.game}) {
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
    if (!game.showDialog) {
      switch (game.direction) {
        case 0:
          animation = idleAnimation;
          break;
        case 1:
          animation = downAnimation;
          if (y < game.mapHeight - height) {
            if (game.collisionDirection != 1) {
              y += dt * game.characterSpeed;
            }
          }
          break;
        case 2:
          animation = leftAnimation;
          if (x > 0) {
            if (game.collisionDirection != 2) {
              x -= dt * game.characterSpeed;
            }
          }

          break;
        case 3:
          animation = upAnimation;
          if (y > 0) {
            if (game.collisionDirection != 3) {
              y -= dt * game.characterSpeed;
            }
          }

          break;
        case 4:
          animation = rightAnimation;
          if (x < game.mapWidth - width) {
            if (game.collisionDirection != 4) {
              x += dt * game.characterSpeed;
            }
          }
          break;
      }
    }
    super.update(dt);
  }
}
