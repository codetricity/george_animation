import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'scene.dart';

class MyGeorgeGame extends FlameGame with TapDetector, HasCollidables {
  late Scene scene;
  Future<void> onLoad() async {
    await super.onLoad();
    scene = Scene(game: this);
    add(scene);
  }
}
