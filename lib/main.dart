import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'package:game1/Game.dart';

void main() async {
  //Flame.device.setLandscape();
  //Flame.device.fullScreen();

  final game = MyGame();
  runApp(GameWidget(game: game));
}
