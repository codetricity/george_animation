import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/main.dart';

import '../characters/obstacle_component.dart';

void loadObstacles(TiledComponent homeMap, MyGeorgeGame game) {
  final obstacleGroup = homeMap.tileMap.getObjectGroupFromLayer('Obstacles');

  for (var obstacleBox in obstacleGroup.objects) {
    game.add(ObstacleComponent(game: game)
      ..position = Vector2(obstacleBox.x, obstacleBox.y)
      ..width = obstacleBox.width
      ..height = obstacleBox.height
      ..debugMode = true);
  }
}
