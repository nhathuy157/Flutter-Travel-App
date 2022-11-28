
import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidths;
  static late double screenHeight;
  static late double defaultSize;
  static late double screenPaddingTop;
  static late double sizeRatio;

  static late double topSafeAreaPadding;
  static late double bottomSafeAreaPadding;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidths = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    sizeRatio = screenWidths / screenHeight;

    topSafeAreaPadding = _mediaQueryData.padding.top;
    bottomSafeAreaPadding = _mediaQueryData.padding.bottom;
  }
}