import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../characters/obstacle_component.dart';
import '../my_george_game.dart';

void loadObstacles(TiledComponent homeMap, MyGeorgeGame game) {
  final obstacleGroup = homeMap.tileMap.getObjectGroupFromLayer('Obstacles');
  for (var obstacleBox in obstacleGroup.objects) {
    var obstacleComponent = ObstacleComponent(game: game)
      ..position = Vector2(obstacleBox.x, obstacleBox.y)
      ..width = obstacleBox.width
      ..height = obstacleBox.height
      ..debugMode = true;
    game.componentList.add(obstacleComponent);
    game.add(obstacleComponent);
  }
}
