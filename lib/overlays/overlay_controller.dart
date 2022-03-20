import 'package:flutter/material.dart';
import 'package:george/overlays/dialog_overlay.dart';
import 'package:george/world/my_george_game.dart';
import 'package:george/world/scene.dart';
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
              Expanded(
                  flex: 2, child: ScoreOverlay(worldScene: game.worldScene)),
              Expanded(
                  flex: 2,
                  child: DialogOverlay(
                    worldScene: game.worldScene,
                    game: game,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
