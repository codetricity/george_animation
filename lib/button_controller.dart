import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:george/main.dart';

class ButtonController extends StatelessWidget {
  final MyGeorgeGame game;
  const ButtonController({Key? key, required this.game}) : super(key: key);

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
                  '${game.friendNumber}',
                  style: const TextStyle(fontSize: 28, color: Colors.black45),
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
                  '${game.bakedGoodsInventory}',
                  style: const TextStyle(fontSize: 28, color: Colors.black45),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
