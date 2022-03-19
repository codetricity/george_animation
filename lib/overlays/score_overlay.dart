import 'package:flutter/material.dart';

import 'overlay.dart';

class ScoreOverlay extends StatelessWidget {
  const ScoreOverlay({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final OverlayController widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              '${widget.game.bakedGoodsInventory}',
              style: const TextStyle(fontSize: 28, color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}
