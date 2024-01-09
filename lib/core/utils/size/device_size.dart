import 'package:flutter/material.dart';

class Device {
  /// Device's BoxConstraintsP
  static late BoxConstraints boxConstraints;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  /// Sets the Screen's size,
  /// `BoxConstraints`, `Height`, and `Width`
  static void setScreenSize(BuildContext context, BoxConstraints constraints) {
    boxConstraints = constraints;

    // Sets screen width and height
    width = boxConstraints.maxWidth;
    height = boxConstraints.maxHeight;
  }
}
