import 'package:flame/flame.dart';

class Loader {
  int _progress = 0;
  int get progress => _progress;

  Future<void> run() async {
    _progress = 0;
    await this._initializeScreen();
    this._progress = 20;
    await this._loadAssets();
    this._progress = 70;
    await this._loadData();
    this._progress = 100;
  }

  Future<void> _initializeScreen() async {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();
  }

  Future<void> _loadAssets() async {}
  Future<void> _loadData() async {}
}
