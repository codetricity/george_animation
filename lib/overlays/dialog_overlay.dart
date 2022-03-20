import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:george/world/scene.dart';

class DialogOverlay extends StatelessWidget {
  const DialogOverlay({Key? key, required this.scene}) : super(key: key);

  final Scene scene;

  @override
  Widget build(BuildContext context) {
    return scene.showDialog
        ? Container(
            color: const Color.fromARGB(167, 218, 218, 218),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  scene.dialogMessage,
                  textStyle: const TextStyle(fontSize: 18),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              isRepeatingAnimation: false,
              onFinished: () {
                print('text dialog is finished');
                scene.showDialog = false;
                scene.game.overlays.notifyListeners();
              },
            ),
          )
        : Container();
  }
}
