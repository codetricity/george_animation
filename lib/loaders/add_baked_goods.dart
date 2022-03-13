import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/main.dart';

import '../characters/baked_good_component.dart';

void addBakedGoods(TiledComponent homeMap, MyGeorgeGame game) async {
  final bakedGoodsGroup = homeMap.tileMap.getObjectGroupFromLayer('BakedGoods');

  for (var bakedGood in bakedGoodsGroup.objects) {
    switch (bakedGood.type) {
      case 'ApplePie':
        game.add(BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await game.loadSprite('apple_pie.png')
          ..height = bakedGood.height
          ..debugMode = true);
        break;
      case 'Cookie':
        game.add(BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await game.loadSprite('cookies.png')
          ..height = bakedGood.height
          ..debugMode = true);
        break;
      case 'CheeseCake':
        game.add(BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await game.loadSprite('cheesecake.png')
          ..height = bakedGood.height
          ..debugMode = true);
        break;
      case 'ChocoCake':
        game.add(BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..sprite = await game.loadSprite('choco_cake.png')
          ..height = bakedGood.height
          ..debugMode = true);
        break;
    }
  }
}
