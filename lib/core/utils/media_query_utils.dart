import 'package:flutter/material.dart';

class MediaQueryUtils {
  /// Gets the height of the screen.
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Gets the width of the screen.
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Gets the height percentage of the screen.
  static double getHeightPercentage(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }

  /// Gets the width percentage of the screen.
  static double getWidthPercentage(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }

  /// Gets the device's pixel ratio.
  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  /// Gets the orientation of the screen.
  static Orientation getOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  /// Gets the padding around the screen.
  static EdgeInsets getScreenPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }
}
