import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:george/main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ButtonController extends StatefulWidget {
  final MyGeorgeGame game;
  const ButtonController({Key? key, required this.game}) : super(key: key);

  @override
  State<ButtonController> createState() => _ButtonControllerState();
}

class _ButtonControllerState extends State<ButtonController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              color: const Color(0x8f37474f),
              child: IconButton(
                icon: const Icon(Icons.volume_up_rounded),
                color: Colors.pink.shade200,
                onPressed: () {
                  FlameAudio.bgm.play('music.mp3');
                },
              ),
            ),
            Container(
              color: const Color(0x8f37474f),
              child: IconButton(
                icon: const Icon(Icons.volume_off_rounded),
                color: Colors.pink.shade200,
                onPressed: () {
                  FlameAudio.bgm.stop();
                },
              ),
            ),
            // Text(
            //   game.soundTrackName,
            //   style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
            // ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Container(
                      color: const Color.fromARGB(167, 218, 218, 218),
                      child: Image.asset(
                        'assets/images/friend.png',
                        scale: .6,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      color: const Color.fromARGB(167, 218, 218, 218),
                      child: Text(
                        '${widget.game.friendNumber}',
                        style: const TextStyle(
                            fontSize: 28, color: Colors.black45),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      color: const Color.fromARGB(167, 218, 218, 218),
                      child: Image.asset(
                        'assets/images/choco_cake.png',
                        scale: .8,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      color: const Color.fromARGB(167, 218, 218, 218),
                      child: Text(
                        '${widget.game.bakedGoodsInventory}',
                        style: const TextStyle(
                            fontSize: 28, color: Colors.black45),
                      ),
                    ),
                  ],
                ),
              ),
              // text box
              Expanded(
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
