import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../characters/obstacle_component.dart';
import '../world/scene.dart';

void loadObstacles({required TiledComponent homeMap, required Scene scene}) {
  final obstacleGroup = homeMap.tileMap.getObjectGroupFromLayer('Obstacles');

  for (var obstacleBox in obstacleGroup.objects) {
    scene.add(ObstacleComponent(scene: scene)
      ..position = Vector2(obstacleBox.x, obstacleBox.y)
      ..width = obstacleBox.width
      ..height = obstacleBox.height
      ..debugMode = true);
  }
}
