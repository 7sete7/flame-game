import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flame/game.dart';

abstract class Screen {
  String name = "";

  void render(Canvas canvas);
  void update(double dt);
  void resize(Vector2 size);
  void onTapDown(TapDownInfo info, Function fn);

  Future<void> onExit();
}
