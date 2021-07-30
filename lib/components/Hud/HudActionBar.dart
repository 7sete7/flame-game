import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame/src/gestures/events.dart';
import 'dart:ui';

import 'package:game1/common/Component.dart' as My;
import 'package:game1/common/ScreenSize.dart';
import 'package:vector_math/vector_math_64.dart';

class HudActionBar extends My.Component {
  late final Vector2 size;
  late final Vector2 position;

  List<ActionBarItem> _items = [];
  late final SpriteBatch _spritesheet;
  SpriteBatchComponent? _batchComponent;

  HudActionBar() : super(Vector2.zero(), Vector2.zero()) {
    this.size = Vector2(screenSize.width, 50);
    this.position = Vector2(0, screenSize.height - this.size.y);

    this.init();
  }

  Future<void> init() async {
    this._spritesheet = await SpriteBatch.load("ItemsHud.png");
    this._loadItems();

    this._batchComponent = SpriteBatchComponent.fromSpriteBatch(this._spritesheet);
    this._batchComponent?.onGameResize(screenSize.getSize());
  }

  void _loadItems() {
    const int ITEMS_SPACING = 5;

    List<ActionBarItem> items = [];

    items.add(ActionBarItem("title", 10).setRect(5, 5, 27, 30));
    items.add(ActionBarItem("title", 10).setRect(5, 5, 27, 30));

    for (int i = 0; i < items.length; i++) {
      ActionBarItem item = items[i];
      double itemX = (item.rect.width * item.scale + ITEMS_SPACING) * i;

      item.setPosition(Vector2(this.position.x + itemX, this.position.y)).addTo(this._spritesheet);
    }

    this._items.addAll(items);
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

class ActionBarItem extends My.Component {
  late final String _id;
  String get id => this._id;

  int price;
  String title;
  String? tooltip;

  late Rect rect;
  final double scale = 1.5;

  ActionBarItem(this.title, this.price, {this.tooltip}) : super(Vector2.zero(), Vector2(0.3, 0.3));

  ActionBarItem setRect(double rectX, double rectY, double rectWidth, double rectHeight) {
    this.rect = Rect.fromLTWH(rectX, rectY, rectWidth, rectHeight);
    return this;
  }

  ActionBarItem setPosition(Vector2 position) {
    this.position = position;
    return this;
  }

  void addTo(SpriteBatch batch) {
    this.resize(screenSize.getSize());

    // ignore: unnecessary_null_comparison
    if (this.rect == null) throw StateError("You must set rect first: $title");
    // ignore: unnecessary_null_comparison
    if (this.x == null) throw StateError("You must set position first: $title");
    print({"x": this.x, "y": this.y, "w": this.width});

    batch.add(source: this.rect, offset: Vector2(this.x, this.y), scale: this.scale);
  }

  @override
  void onTapDown(TapDownInfo info, Function fn) {}

  @override
  void render(Canvas canvas) {}

  @override
  void resize(Vector2 size) {}

  @override
  void update(double dt) {}
}
