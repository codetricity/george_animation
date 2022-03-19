import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class AudioOverlay extends StatelessWidget {
  const AudioOverlay({
    Key? key,
  }) : super(key: key);

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
      ],
    );
  }
}
