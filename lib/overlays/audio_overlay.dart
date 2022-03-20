import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:george/my_george_game.dart';

class AudioOverlay extends StatelessWidget {
  const AudioOverlay({Key? key, required this.game}) : super(key: key);

  final MyGeorgeGame game;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Container(
          color: const Color(0x8f37474f),
          child: IconButton(
            icon: const Icon(Icons.map_outlined),
            color: Colors.pink.shade200,
            onPressed: () {
              game.newScene(2);
            },
          ),
        ),
      ],
    );
  }
}
