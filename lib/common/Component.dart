import 'dart:ui';

import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:game1/common/BaseWidget.dart';
import 'package:vector_math/vector_math_64.dart';

abstract class Component extends BaseWidget {
  Vector2 _position = Vector2(0, 0);
  set position(Vector2 value) => this._position = value;

  Vector2 _size = Vector2(0, 0);
  set size(Vector2 value) => this._size = value;

  double get x => _position.x;
  double get y => _position.y;
  double get width => _size.x;
  double get height => _size.y;

  @mustCallSuper
  Component(this._position, this._size);

  @override
  void render(Canvas canvas);

  @override
  void resize(Vector2 size);

  @override
  void update(double dt);

  @override
  void onTapDown(TapDownInfo info, Function fn);
}
