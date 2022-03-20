import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../characters/baked_good_component.dart';
import '../world/scene.dart';

void addBakedGoods(TiledComponent homeMap, Scene scene) async {
  final bakedGoodsGroup = homeMap.tileMap.getObjectGroupFromLayer('BakedGoods');

  for (var bakedGood in bakedGoodsGroup.objects) {
    switch (bakedGood.type) {
      case 'ApplePie':
        scene.add(BakedGoodComponent(scene: scene)
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await scene.game.loadSprite('apple_pie.png')
          ..height = bakedGood.height
          ..debugMode = true);
        break;
      case 'Cookie':
        scene.add(BakedGoodComponent(scene: scene)
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await scene.game.loadSprite('cookies.png')
          ..height = bakedGood.height
          ..debugMode = true);
        break;
      case 'CheeseCake':
        scene.add(BakedGoodComponent(scene: scene)
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await scene.game.loadSprite('cheesecake.png')
          ..height = bakedGood.height
          ..debugMode = true);
        break;
      case 'ChocoCake':
        scene.add(BakedGoodComponent(scene: scene)
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await scene.game.loadSprite('choco_cake.png')
          ..height = bakedGood.height
          ..debugMode = true);
        break;
    }
  }
}
