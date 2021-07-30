import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:game1/common/ScreenSize.dart';
import 'package:game1/Stage.dart';
import 'ScreenManager.dart';

class MyGame extends BaseGame with TapDetector {
  Stage? stage;

  @override
  Future<void> onLoad() async {
    print("OnLoad");
    await ScreenManager.init();
    screenSize.resize(this.size);

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    //stage!.render(canvas);
    ScreenManager.render(canvas);
    super.render(canvas);
  }

  @override
  void update(double dt) {
    ScreenManager.update(dt);
    super.update(dt);
  }

  @override
  void onResize(Vector2 canvasSize) {
    /*print("OnResize X: ${canvasSize.x}; Y: ${canvasSize.y}");
    if (this.stage != null) {
      stage?.onResize(canvasSize);
    }*/
    ScreenManager.resize(canvasSize);
    screenSize.resize(canvasSize);
    super.onResize(canvasSize);
  }

  void onTapDown(TapDownInfo info) {
    print("Game tap");
    ScreenManager.onTapDown(info);
  }

  //@override
  //Color backgroundColor() => const Color(0xFF222222);
}
