import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'scene.dart';

class MyGeorgeGame extends FlameGame with TapDetector, HasCollidables {
  final double characterSize = 64;
  final double characterSpeed = 80;
  late WorldScene worldScene;
  // direction of George
  // 0=idle, 1=down, 2= left, 3= up, 4=right
  int direction = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    worldScene = WorldScene(mapFile: 'map.tmx', game: this);
    add(worldScene);

    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.load('music.mp3');
    FlameAudio.bgm.play('music.mp3');
    overlays.add('OverlayController');
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // 0=idle, 1=down, 2= left, 3= up, 4=right
  }

  @override
  void onTapUp(TapUpInfo info) {
    direction += 1;
    if (direction > 4) {
      direction = 0;
    }
  }
}
