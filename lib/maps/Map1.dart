import 'package:game1/enums/Stage.dart';
import 'package:game1/Stage.dart';

import 'package:flame/game.dart';

class Map1 extends Stage {
  Map1() : super(size: MapSize.Small) {
    this.setupTrenches([1, 5]);
  }
}
