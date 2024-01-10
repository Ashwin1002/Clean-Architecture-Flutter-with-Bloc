import 'package:flutter/material.dart';
import 'package:medhavi_app/core/utils/size/size_utils.dart';

class AppScales {
  ///[border radius]
  ///
  ///For large container like sheets and dialogs
  static Radius largeRadius = Radius.circular(16.adaptSize);

  /// Medium components like cards, snacks, banners
  static Radius defaultRadius = Radius.circular(12.adaptSize);

  /// Medium components which is inside nested components like buttons
  static Radius mediumRadius = Radius.circular(8.adaptSize);

  // Small components like tags
  static Radius smallRadius = Radius.circular(4.adaptSize);

  ///elevation

  ///low above
  static Offset lowAboveElevationOffset = Offset(0.0, -4.adaptSize);
  static double lowAboveElevationRadius = 4.0;

  ///low down
  static Offset lowDownElevationOffset = Offset(0, 5.adaptSize);
  static double lowDownElevationRadius = 5.0;

  ///shallow above
  static Offset shallowAboveElevationOffset = Offset(0.0, -4.adaptSize);
  static double shallowAboveElevationRadius = 16.0;

  ///shallow down
  static Offset shallowDownElevationOffset = Offset(0.0, 4.adaptSize);
  static double shallowDownElevationRadius = 16.0;

  ///deep above
  static Offset deepAboveOffset = Offset(0.0, -16.adaptSize);
  static double deepAboveRadius = 48.0;

  ///deep down
  static Offset deepDownOffset = Offset(0.0, 16.adaptSize);
  static double deepDownRadius = 48.0;
}
