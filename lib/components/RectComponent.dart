import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:game1/common/ProportionComponent.dart';
import 'package:vector_math/vector_math_64.dart';

class RectComponent extends ProportionComponent {
  late Paint _paint;
  late Rect _rect;

  RectComponent(Vector2 positionRate, Vector2 sizeRate)
      : this._paint = Paint(),
        this._rect = Rect.zero,
        super(positionRate, sizeRate);

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
    super.resize(size);
    this._rect = Rect.fromLTWH(this.x, this.y, this.width, this.height);
  }
}
