import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:game1/Stage.dart';
import 'package:game1/common/Screen.dart';
import 'package:game1/screens/Menu.dart';
import 'package:game1/screens/Play.dart';
import 'package:game1/store/Loader.dart';

class ScreenManager {
  static Map<String, Function> _screens = {};
  static Screen? _currentScreen;

  static set currentScreen(value) => null;
  static Screen? get currentScreen => _currentScreen;

  static Loader _loader = Loader();

  static Future<void> init() async {
    print("ScreenManager init");
    _currentScreen = Menu(_loader);
    await _loader.run();

    ScreenManager.addScreen("menu", (dynamic params) => Menu(_loader));
    ScreenManager.addScreen("play", (dynamic params) => Play(_loader, params['map']));
  }

  static void addScreen(String name, Screen Function(dynamic params) initScreenFn) {
    _screens.putIfAbsent(name, () => initScreenFn);
  }

  static void removeScreen(String name) {
    _screens.remove(name);
  }

  static void switchScreen(String name, {dynamic params}) async {
    bool isSameScreen = currentScreen?.name == name;

    if (!isSameScreen && _screens.containsKey(name)) {
      await _currentScreen?.onExit();

      Function? initScreenFn = _screens[name];
      Screen? newScreen = initScreenFn?.call(params);

      if (newScreen != null) _currentScreen = newScreen;
    }
  }

  static void render(Canvas canvas) {
    _currentScreen?.render(canvas);
  }

  static void update(double dt) {
    _currentScreen?.update(dt);
  }

  static void resize(Vector2 size) {
    _currentScreen?.resize(size);
  }

  static void onTapDown(TapDownInfo info) {
    _currentScreen?.onTapDown(info, () {});
  }
}
