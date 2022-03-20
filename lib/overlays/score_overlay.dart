import 'package:flutter/material.dart';
import '../world/scene.dart';

class ScoreOverlay extends StatelessWidget {
  const ScoreOverlay({
    Key? key,
    required this.scene,
  }) : super(key: key);

  final Scene scene;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            '${scene.friendNumber}',
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
            '${scene.bakedGoodsInventory}',
            style: const TextStyle(fontSize: 28, color: Colors.black45),
          ),
        ),
      ],
    );
  }
}
