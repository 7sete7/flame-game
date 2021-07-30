import 'package:flame/components.dart';

ScreenSize screenSize = ScreenSize();

class ScreenSize {
  late Vector2 _size;

  Vector2 getSize() => this._size;
  void resize(Vector2 size) => this._size = size;

  double get width => _size.x;
  double get height => _size.y;
}
