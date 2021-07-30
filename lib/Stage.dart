import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:game1/common/ScreenSize.dart';

import 'package:game1/enums/Stage.dart';

class Stage {
  final String seed;
  final MapSize size;
  late List<Rect> trenches;

  List<MapColumn> columns = [];

  Stage({this.seed = "asd", required this.size}) {
    Map columnSize = this.getColumnsSize(screenSize.getSize());

    for (var i = 0; i < columnSize['qtd']; i++) {
      MapColumn column = new MapColumn(x: (i * columnSize['size']) as double, width: columnSize['size'], height: screenSize.height, index: i);
      columns.add(column);
    }
  }

  void setupTrenches(List<int> positions) {
    positions.forEach((column) => this.columns[column].hasTrench = true);
  }

  void render(Canvas canvas) {
    for (MapColumn column in this.columns) {
      Rect columnRect = column.getRect();
      canvas.drawRect(columnRect, column.paint);
    }
  }

  void onResize(Vector2 size) {
    Map columnSize = this.getColumnsSize(size);

    columns.forEach((column) => column.updateRect(x: (column.index * columnSize['size']) as double, width: columnSize['size'], height: size.y));
  }

  Map<String, double> getColumnsSize(Vector2 size) {
    double columnsQtd = 0;
    switch (this.size) {
      case MapSize.Small:
        columnsQtd = 7;
        break;
      case MapSize.Medium:
        columnsQtd = 11;
        break;
      case MapSize.Big:
        columnsQtd = 13;
    }

    double columnSize = size.x / columnsQtd;
    return {"size": columnSize, "qtd": columnsQtd};
  }
}

class MapColumn {
  double x;
  double width;
  double height;
  final int index;

  bool hasTrench = false;
  Paint paint = Paint();

  MapColumn({required this.x, required this.width, required this.height, required this.index}) {
    this.paint.color = new Color(0x00000000);
  }

  void updateRect({x, width, height}) {
    this.x = x;
    this.width = width;
    this.height = height;
  }

  Rect getRect() {
    Rect rect = Rect.fromLTWH(this.x, 0, this.width, this.height);
    if (this.hasTrench) {
      this.paint.color = new Color(0xd6d6d6d6);
    } else {
      this.paint.color = new Color(0x67676767);
    }

    return rect;
  }
}
