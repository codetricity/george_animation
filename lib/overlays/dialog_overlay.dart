import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:george/my_george_game.dart';

class DialogOverlay extends StatelessWidget {
  const DialogOverlay({Key? key, required this.game}) : super(key: key);

  final MyGeorgeGame game;

  @override
  Widget build(BuildContext context) {
    return game.showDialog
        ? Container(
            color: const Color.fromARGB(167, 218, 218, 218),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  game.dialogMessage,
                  textStyle:
                      const TextStyle(fontSize: 30, fontFamily: 'arcade'),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              isRepeatingAnimation: false,
              onFinished: () {
                print('text dialog is finished');
                game.showDialog = false;
                game.overlays.notifyListeners();
              },
            ),
          )
        : Container();
  }
}
