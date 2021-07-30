import 'package:flame/components.dart';
import 'package:flame/src/gestures/events.dart';
import 'dart:ui';

import 'package:game1/common/BaseWidget.dart';
import 'package:game1/components/Hud/HudActionBar.dart';
import 'package:vector_math/vector_math_64.dart';

class Hud extends BaseWidget {
  HudActionBar _actionBar = HudActionBar();

  @override
  void onTapDown(TapDownInfo info, Function fn) {}

  @override
  void render(Canvas canvas) {
    _actionBar.render(canvas);
  }

  @override
  void resize(Vector2 size) {
    _actionBar.resize(size);
  }

  @override
  void update(double dt) {
    _actionBar.update(dt);
  }
}
