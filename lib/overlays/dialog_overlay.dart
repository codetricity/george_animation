import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:george/overlays/overlay_controller.dart';

class DialogOverlay extends StatelessWidget {
  const DialogOverlay({Key? key, required this.widget}) : super(key: key);

  final OverlayController widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(167, 218, 218, 218),
      child: widget.game.showDialog
          ? AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(widget.game.dialogMessage,
                    textStyle: const TextStyle(fontSize: 18),
                    speed: const Duration(milliseconds: 100)),
              ],
              isRepeatingAnimation: false,
              onFinished: () {
                print('character dialog is finished');
                widget.game.showDialog = false;
                widget.game.overlays.notifyListeners();
              },
            )
          : Container(),
    );
  }
}
