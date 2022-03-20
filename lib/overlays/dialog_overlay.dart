import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:george/world/my_george_game.dart';
import 'package:george/world/scene.dart';

class DialogOverlay extends StatelessWidget {
  const DialogOverlay({Key? key, required this.worldScene, required this.game})
      : super(key: key);

  final WorldScene worldScene;
  final MyGeorgeGame game;

  @override
  Widget build(BuildContext context) {
    return worldScene.showDialog
        ? Container(
            color: const Color.fromARGB(167, 218, 218, 218),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  worldScene.dialogMessage,
                  textStyle: const TextStyle(fontSize: 18),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              isRepeatingAnimation: false,
              onFinished: () {
                print('text dialog is finished');
                worldScene.showDialog = false;
                game.overlays.notifyListeners();
              },
            ),
          )
        : Container();
  }
}
