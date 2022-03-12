import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import 'package:george/main.dart';

class GeorgeComponent extends SpriteAnimationComponent
    with HasHitboxes, Collidable, HasGameRef<MyGeorgeGame> {
  GeorgeComponent() {
    addHitbox(HitboxRectangle());
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
  }

  @override
  void update(double dt) {
    switch (gameRef.direction) {
      case 0:
        animation = idleAnimation;
        break;
      case 1:
        animation = downAnimation;
        if (y < gameRef.mapHeight - height) {
          y += dt * gameRef.characterSpeed;
        }
        break;
      case 2:
        animation = leftAnimation;
        if (x > 0) {
          x -= dt * gameRef.characterSpeed;
        }

        break;
      case 3:
        animation = upAnimation;
        if (y > 0) {
          y -= dt * gameRef.characterSpeed;
        }

        break;
      case 4:
        animation = rightAnimation;
        if (x < gameRef.mapWidth - width) {
          x += dt * gameRef.characterSpeed;
        }
        break;
    }
    super.update(dt);
  }
}
