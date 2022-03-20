import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:george/overlays/dialog_overlay.dart';
import 'package:george/world/my_george_game.dart';
import '../world/scene.dart';
import 'audio_overlay.dart';
import 'score_overlay.dart';

class OverlayController extends StatelessWidget {
  final MyGeorgeGame game;
  const OverlayController({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AudioOverlay(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(flex: 2, child: ScoreOverlay(scene: game.scene)),
              Expanded(
                  flex: 2,
                  child: DialogOverlay(
                    scene: game.scene,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
