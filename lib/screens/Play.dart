import 'package:flame/src/gestures/events.dart';
import 'package:game1/ScreenManager.dart';
import 'package:game1/Stage.dart';
import 'dart:ui';

import 'package:game1/common/Background.dart';
import 'package:game1/common/Screen.dart';
import 'package:game1/components/Button.dart';
import 'package:game1/components/Hud/Hud.dart';
import 'package:game1/store/Loader.dart';
import 'package:vector_math/vector_math_64.dart';

class Play extends Screen {
  final Loader _loader;

  Stage _stage;
  Background? _background;
  late Hud _hud;
  Button? _btn;

  Color backgroundColor() => const Color.fromRGBO(255, 200, 200, 1);

  Play(this._loader, this._stage) {
    this._hud = Hud();

    Button btn = Button(Vector2(0.7, 0.8), Vector2(0.2, 0.1), Color.fromRGBO(200, 200, 150, 1));
    btn.setText("Voltar");
    btn.onClick((TapDownInfo info) => ScreenManager.switchScreen("menu"));
    this._btn = btn;
  }

  @override
  Future<void> onExit() async {}

  @override
  void onTapDown(TapDownInfo info, Function fn) {
    this._btn?.onTapDown(info, fn);
  }

  @override
  void render(Canvas canvas) {
    Paint p = Paint();
    p.color = backgroundColor();
    canvas.save();
    //canvas.drawRect(Rect.largest, p);
    this._stage.render(canvas);
    this._hud.render(canvas);
    this._btn?.render(canvas);
    canvas.restore();
  }

  @override
  void resize(Vector2 size) {
    this._stage.onResize(size);
    this._hud.resize(size);
    this._btn?.resize(size);
  }

  @override
  void update(double dt) {
    this._hud.update(dt);
  }
}
