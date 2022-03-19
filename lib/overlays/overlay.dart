import 'package:flutter/material.dart';
import '../my_george_game.dart';
import 'audio_overlay.dart';
import 'dialog_overlay.dart';
import 'score_overlay.dart';

class OverlayController extends StatefulWidget {
  final MyGeorgeGame game;
  const OverlayController({Key? key, required this.game}) : super(key: key);

  @override
  State<OverlayController> createState() => _OverlayControllerState();
}

class _OverlayControllerState extends State<OverlayController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AudioOverlay(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScoreOverlay(
                widget: widget,
              ),
              // text box
              DialogOverlay(widget: widget),
            ],
          ),
        )
      ],
    );
  }
}
