import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/world/scene.dart';
import '../characters/baked_good_component.dart';
import '../world/my_george_game.dart';

void addBakedGoods(
    TiledComponent homeMap, WorldScene worldScene, MyGeorgeGame game) async {
  final bakedGoodsGroup = homeMap.tileMap.getObjectGroupFromLayer('BakedGoods');

  for (var bakedGood in bakedGoodsGroup.objects) {
    switch (bakedGood.type) {
      case 'ApplePie':
        worldScene.add(BakedGoodComponent(worldScene: worldScene, game: game)
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await game.loadSprite('apple_pie.png')
          ..height = bakedGood.height
          ..debugMode = true);
        break;
      case 'Cookie':
        worldScene.add(BakedGoodComponent(worldScene: worldScene, game: game)
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await game.loadSprite('cookies.png')
          ..height = bakedGood.height
          ..debugMode = true);
        break;
      case 'CheeseCake':
        worldScene.add(BakedGoodComponent(worldScene: worldScene, game: game)
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await game.loadSprite('cheesecake.png')
          ..height = bakedGood.height
          ..debugMode = true);
        break;
      case 'ChocoCake':
        worldScene.add(BakedGoodComponent(worldScene: worldScene, game: game)
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await game.loadSprite('choco_cake.png')
          ..height = bakedGood.height
          ..debugMode = true);
        break;
    }
  }
}
