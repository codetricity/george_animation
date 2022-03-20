import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../characters/obstacle_component.dart';
import '../world/my_george_game.dart';
import '../world/scene.dart';

void loadObstacles(TiledComponent homeMap, WorldScene worldScene) {
  final obstacleGroup = homeMap.tileMap.getObjectGroupFromLayer('Obstacles');

  for (var obstacleBox in obstacleGroup.objects) {
    worldScene.add(ObstacleComponent(worldScene: worldScene)
      ..position = Vector2(obstacleBox.x, obstacleBox.y)
      ..width = obstacleBox.width
      ..height = obstacleBox.height
      ..debugMode = true);
  }
}
