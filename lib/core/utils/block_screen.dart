import 'package:flutter/services.dart';

abstract class BlockScreen {
  static final blockScreen = SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}
