import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'button_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  runApp(MaterialApp(
    home: Scaffold(
      body: GameWidget(
        game: MyGeorgeGame(),
        overlayBuilderMap: {
          'ButtonController': (BuildContext context, MyGeorgeGame game) {
            return ButtonController(
              game: game,
            );
          }
        },
      ),
    ),
  ));
}

class MyGeorgeGame extends FlameGame with TapDetector, HasCollidables {
  late SpriteAnimation downAnimation;
  late SpriteAnimation leftAnimation;
  late SpriteAnimation rightAnimation;
  late SpriteAnimation upAnimation;
  late SpriteAnimation idleAnimation;

  late GeorgeComponent george;
  late double mapWidth;
  late double mapHeight;

  // 0=idle, 1=down, 2= left, 3= up, 4=right
  int direction = 0;
  final double animationSpeed = .1;
  final double characterSize = 100;
  final double characterSpeed = 80;
  String soundTrackName = 'ukulele';

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final homeMap = await TiledComponent.load('map.tmx', Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16.0;
    mapHeight = homeMap.tileMap.map.height * 16.0;

    final friendGroup = homeMap.tileMap.getObjectGroupFromLayer('Friends');

    for (var friendBox in friendGroup.objects) {
      add(FriendComponent()
        ..position = Vector2(friendBox.x, friendBox.y)
        ..width = friendBox.width
        ..height = friendBox.height
        ..debugMode = true);
    }

    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.load('music.mp3');
    overlays.add('ButtonController');

    final spriteSheet = SpriteSheet(
        image: await images.load('george2.png'), srcSize: Vector2(48, 48));

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

    george = GeorgeComponent()
      ..animation = idleAnimation
      ..position = Vector2(100, 200)
      ..debugMode = true
      ..size = Vector2.all(characterSize);

    add(george);

    camera.followComponent(george,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // 0=idle, 1=down, 2= left, 3= up, 4=right

    switch (direction) {
      case 0:
        george.animation = idleAnimation;
        break;
      case 1:
        george.animation = downAnimation;
        if (george.y < mapHeight - george.height) {
          george.y += dt * characterSpeed;
        }
        break;
      case 2:
        george.animation = leftAnimation;
        if (george.x > 0) {
          george.x -= dt * characterSpeed;
        }

        break;
      case 3:
        george.animation = upAnimation;
        if (george.y > 0) {
          george.y -= dt * characterSpeed;
        }

        break;
      case 4:
        george.animation = rightAnimation;
        if (george.x < mapWidth - george.width) {
          george.x += dt * characterSpeed;
        }
        break;
    }
  }

  @override
  void onTapUp(TapUpInfo info) {
    direction += 1;
    if (direction > 4) {
      direction = 0;
    }
  }
}

class FriendComponent extends PositionComponent with HasHitboxes, Collidable {
  FriendComponent() {
    addHitbox(HitboxRectangle());
  }

  @override
  void onCollisionEnd(Collidable other) {
    print('I made a new friend!');
    remove(this);
    super.onCollisionEnd(other);
  }
}

class GeorgeComponent extends SpriteAnimationComponent
    with HasHitboxes, Collidable {
  GeorgeComponent() {
    addHitbox(HitboxRectangle());
  }
}
