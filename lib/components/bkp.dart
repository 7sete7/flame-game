import 'dart:ui';

import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:game1/common/Component.dart';
import 'package:vector_math/vector_math_64.dart';

class RectComponent extends Component {
  Vector2 _positionRate;
  Vector2 _sizeRate;

  late Paint _paint;
  late Rect _rect;

  RectComponent(this._positionRate, this._sizeRate)
      : this._paint = Paint(),
        this._rect = Rect.zero,
        super(Vector2.zero(), Vector2.zero());

  void paint(Color color) {
    this._paint.color = color;
  }

  @override
  @mustCallSuper
  void render(Canvas canvas) {
    canvas.save();
    canvas.drawRect(this._rect, this._paint);
    this._drawTresholdLines(canvas);
    canvas.restore();
  }

  void _drawTresholdLines(Canvas canvas) {
    Paint p = Paint();
    p.color = Color.fromRGBO(255, 255, 255, 1);

    canvas.drawLine(Offset(this.x, this.y), Offset(this.x + width, this.y + height), p);
    canvas.drawLine(Offset(this.x + width, this.y), Offset(this.x, this.y + height), p);
  }

  @override
  @mustCallSuper
  void resize(Vector2 size) {
    this.position = Vector2(size.x * this._positionRate.x, size.y * this._positionRate.y);
    this.size = Vector2(size.x * this._sizeRate.x, size.y * this._sizeRate.y);
    this._rect = Rect.fromLTWH(this.x, this.y, this.width, this.height);
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
