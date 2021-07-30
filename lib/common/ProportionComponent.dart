import 'dart:ui';

import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:game1/common/Component.dart';
import 'package:vector_math/vector_math_64.dart';

class ProportionComponent extends Component {
  Vector2 _positionRate;
  set positionRate(value) => this._positionRate = value;

  Vector2 _sizeRate;
  set sizeRate(value) => this._sizeRate = value;

  ProportionComponent(this._positionRate, this._sizeRate) : super(Vector2.zero(), Vector2.zero());

  @override
  void render(Canvas canvas) {}

  @override
  @mustCallSuper
  void resize(Vector2 size) {
    this.position = Vector2(size.x * this._positionRate.x, size.y * this._positionRate.y);
    this.size = Vector2(size.x * this._sizeRate.x, size.y * this._sizeRate.y);
  }

  @override
  void update(double dt) {}

  @override
  void onTapDown(TapDownInfo info, Function fn) {}

  bool wasTapped(TapDownInfo info) {
    Vector2 pos = info.eventPosition.global;
    return pos.x >= this.x && pos.x <= this.x + this.width && pos.y >= this.y && pos.y <= this.y + this.height;
  }
}
