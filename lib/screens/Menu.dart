import 'dart:ui';
import 'dart:async' as DartAsync;

import 'package:flame/components.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart' as Material;
import 'package:game1/ScreenManager.dart';
import 'package:game1/common/Background.dart';
import 'package:game1/common/Screen.dart';
import 'package:game1/components/Button.dart';
import 'package:game1/maps/all.dart';
import 'package:game1/store/Loader.dart';
import 'package:vector_math/vector_math_64.dart';

class Menu extends Screen {
  late Background _background;
  final Loader _loader;

  List<Button> _buttons = [];

  Menu(this._loader) {
    this._background = Background("Papaco.png");

    Button startBtn = Button(Vector2(0.35, 0.7), Vector2(0.3, 0.15), Material.Colors.red[300]);
    startBtn.setText("Iniciar");
    startBtn.onClick((TapDownInfo info) => ScreenManager.switchScreen("play", params: {"map": Stages['Map1']}));

    this._buttons.add(startBtn);
  }

  @override
  Future<void> onExit() async {}

  @override
  void render(Canvas canvas) {
    this._background.render(canvas);
    for (Button btn in this._buttons) btn.render(canvas);
  }

  @override
  void resize(Vector2 size) {
    this._background.resize(size);
    for (Button btn in this._buttons) btn.resize(size);
  }

  @override
  void update(double dt) {}

  @override
  void onTapDown(TapDownInfo info, Function fn) {
    this._background.onTapDown(info, fn);
    for (Button btn in this._buttons) btn.onTapDown(info, fn);
  }
}
