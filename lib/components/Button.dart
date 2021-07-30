import 'dart:math';
import 'dart:ui';

import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:game1/common/ScreenSize.dart';
import 'package:game1/components/RectComponent.dart';
import 'package:vector_math/vector_math_64.dart';

class Button extends RectComponent {
  void Function(TapDownInfo)? _onClick;
  String _text = "";
  String get text => _text;

  Vector2 _textPaddingRatio = Vector2(0.2, 0.1);
  Paragraph _paragraph = ParagraphBuilder(ParagraphStyle()).build();
  ParagraphStyle _style = ParagraphStyle(fontSize: 22, fontWeight: FontWeight.bold, textAlign: TextAlign.center);

  Button(Vector2 positionRate, Vector2 sizeRate, Color? color) : super(positionRate, sizeRate) {
    this.paint(color ?? Color(0x0000000));
    this.resize(screenSize.getSize());
  }

  void onClick(void Function(TapDownInfo) cb) {
    this._onClick = cb;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawParagraph(this._paragraph, this.getTextPosition());
  }

  @override
  void resize(Vector2 size) {
    super.resize(size);

    double maxWidth = this.width - (this.width * _textPaddingRatio.x) * 2;
    _paragraph.layout(ParagraphConstraints(width: maxWidth));
  }

  @override
  void onTapDown(TapDownInfo info, Function fn) {
    if (this.wasTapped(info)) this._onClick!(info);
  }

  void setText(String txt) {
    ParagraphBuilder paragraphBuilder = ParagraphBuilder(this._style);
    paragraphBuilder.addText(txt);

    this._paragraph = paragraphBuilder.build();
    this.resize(screenSize.getSize());

    this._text = txt;
  }

  Offset getTextPosition() {
    const X_PADDING_SHIFT = 40;

    double offsetX = max((this.width / 2) - this._paragraph.longestLine / 2, this.width * this._textPaddingRatio.x);
    double offsetY = (this.height / 2) - this._paragraph.height / 2;

    return Offset(this.x + offsetX - X_PADDING_SHIFT, this.y + offsetY);
  }
}
