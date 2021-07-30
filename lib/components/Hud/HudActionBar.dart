import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:game1/common/BaseWidget.dart';
import 'dart:ui';

import 'package:game1/common/Component.dart' as My;
import 'package:game1/common/ProportionComponent.dart';
import 'package:game1/common/ScreenSize.dart';
import 'package:vector_math/vector_math_64.dart';

class HudActionBar extends My.Component {
  final Vector2 _position = Vector2(0, 0);
  final Vector2 _size = Vector2(100, 100);

  List<ActionBarItem> _items = [];
  late final SpriteBatch _spritesheet;
  SpriteBatchComponent? _batchComponent;

  HudActionBar() : super(Vector2.zero(), Vector2.zero()) {
    this.init();
  }

  Future<void> init() async {
    this._spritesheet = await SpriteBatch.load("ItemsHud.png");
    this._loadItems();

    this._batchComponent = SpriteBatchComponent.fromSpriteBatch(this._spritesheet);
    this._batchComponent?.onGameResize(screenSize.getSize());
  }

  void _loadItems() {
    ActionBarItem firstItem = ActionBarItem("title", 10);
    firstItem.setRect(30, 10, Vector2(0.3, 0.3)).setPosition(Vector2(0.3, 0.3)).addTo(this._spritesheet);

    this._items.add(firstItem);
  }

  @override
  void onTapDown(TapDownInfo info, Function fn) {}

  @override
  void render(Canvas canvas) {
    this._batchComponent?.render(canvas);
  }

  @override
  void resize(Vector2 size) {
    this._batchComponent?.onGameResize(size);
    for (ActionBarItem item in this._items) item.resize(size);
  }

  @override
  void update(double dt) {
    for (ActionBarItem item in this._items) item.update(dt);
  }
}

class ActionBarItem extends ProportionComponent {
  late final String _id;
  String get id => this._id;

  int price;
  String title;
  String? tooltip;

  late Rect _rect;

  ActionBarItem(this.title, this.price, {this.tooltip}) : super(Vector2.zero(), Vector2.zero());

  ActionBarItem setRect(double xy, double yx, Vector2 sizeRate) {
    this.sizeRate = sizeRate;

    this._rect = Rect.fromLTWH(xy, yx, this.width, this.height);
    return this;
  }

  ActionBarItem setPosition(Vector2 positionRate) {
    this.positionRate = positionRate;
    return this;
  }

  void addTo(SpriteBatch batch) {
    // ignore: unnecessary_null_comparison
    if (this._rect == null) throw StateError("You must set rect first: $title");
    // ignore: unnecessary_null_comparison
    if (this.x == null) throw StateError("You must set position first: $title");

    batch.add(source: this._rect, offset: Vector2(this.x, this.y));
  }

  @override
  void onTapDown(TapDownInfo info, Function fn) {}

  @override
  void render(Canvas canvas) {}

  @override
  void resize(Vector2 size) {
    super.resize(size);
  }

  @override
  void update(double dt) {}
}
