import 'package:flutter/widgets.dart';

final view = WidgetsBinding.instance.platformDispatcher.views.first;
final viewSize = MediaQueryData.fromView(view).size;

class CommonConfigs {
  static double screenWidth = viewSize.width;
  static double screenHeight = viewSize.height;
}
