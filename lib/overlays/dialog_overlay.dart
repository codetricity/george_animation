import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'overlay.dart';

class DialogOverlay extends StatelessWidget {
  const DialogOverlay({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final OverlayController widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: widget.game.showDialog
          ? Container(
              color: const Color.fromARGB(167, 218, 218, 218),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(widget.game.dialogMessage,
                      textStyle: const TextStyle(
                        fontSize: 18,
                      ),
                      speed: const Duration(milliseconds: 100)),
                ],
                isRepeatingAnimation: false,
                onFinished: () {
                  print('text dialog is finished');
                  widget.game.showDialog = false;
                  widget.game.overlays.notifyListeners();
                },
              ),
            )
          : Container(),
    );
  }
}
