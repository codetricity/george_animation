import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../characters/baked_good_component.dart';
import '../my_george_game.dart';

void addBakedGoods(TiledComponent homeMap, MyGeorgeGame game) async {
  final bakedGoodsGroup = homeMap.tileMap.getObjectGroupFromLayer('BakedGoods');

  for (var bakedGood in bakedGoodsGroup.objects) {
    switch (bakedGood.type) {
      case 'ApplePie':
        var component = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await game.loadSprite('apple_pie.png')
          ..height = bakedGood.height
          ..debugMode = true;
        game.componentList.add(component);
        game.add(component);
        break;
      case 'Cookie':
        var component = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await game.loadSprite('cookies.png')
          ..height = bakedGood.height
          ..debugMode = true;
        game.componentList.add(component);
        game.add(component);
        break;
      case 'CheeseCake':
        var component = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await game.loadSprite('cheesecake.png')
          ..height = bakedGood.height
          ..debugMode = true;
        game.componentList.add(component);
        game.add(component);
        break;
      case 'ChocoCake':
        var component = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await game.loadSprite('choco_cake.png')
          ..height = bakedGood.height
          ..debugMode = true;
        game.add(component);
        game.componentList.add(component);
        break;
    }
  }
}
