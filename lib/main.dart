import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'overlays/overlay_controller.dart';
import 'world/my_george_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  runApp(MaterialApp(
    home: Scaffold(
      body: GameWidget(
        game: MyGeorgeGame(),
        overlayBuilderMap: {
          'OverlayController': (BuildContext context, MyGeorgeGame game) {
            return OverlayController(
              game: game,
            );
          }
        },
      ),
    ),
  ));
}
