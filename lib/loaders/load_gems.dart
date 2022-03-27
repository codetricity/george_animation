import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../characters/gem_component.dart';
import '../my_george_game.dart';

void loadGems(TiledComponent homeMap, MyGeorgeGame game) async {
  final gemGroup = homeMap.tileMap.getObjectGroupFromLayer('Gems');
  print('loading gems');

  for (var gemBox in gemGroup.objects) {
    var gem = GemComponent()
      ..position = Vector2(gemBox.x, gemBox.y - gemBox.height)
      ..sprite = await game.loadSprite('CutRuby.png')
      ..width = gemBox.width
      ..height = gemBox.height
      ..debugMode = true;
    game.componentList.add(gem);
    game.add(gem);
    print('added gem');
  }
}
