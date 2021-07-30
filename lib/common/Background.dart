import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:game1/common/BaseWidget.dart';
import 'package:vector_math/vector_math_64.dart';

class Background extends BaseWidget {
  SpriteComponent? sprite;

  Background(String src) {
    this.init(src);
  }

  Future<void> init(String src) async {
    Sprite sp = await Sprite.load(src);
    this.sprite = SpriteComponent(size: Vector2.zero(), sprite: sp);
  }

  @override
  void render(Canvas canvas) {
    this.sprite?.render(canvas);
  }

  @override
  void resize(Vector2 size) {
    this.sprite?.width = size.x;
    this.sprite?.height = size.y;
    this.sprite?.onGameResize(size);
  }

  @override
  void update(double dt) {}

  @override
  void onTapDown(TapDownInfo info, Function fn) {}
}
