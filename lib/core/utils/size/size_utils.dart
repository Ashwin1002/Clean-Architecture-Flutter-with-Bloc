import 'dart:io';

import 'package:medhavi_app/core/utils/size/device_size.dart';

// This functions are responsible to make UI responsive across all the mobile devices.

// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
const num figmaDesignWidth = 412;
const num figmaDesignHeight = 892;
const num figmaDesignStatusBar = 68;

///This extension is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
extension ResponsiveExtension on num {
  ///This method is used to get device viewport width.
  get width {
    return Device.width;
  }

  ///This method is used to get device viewport height.
  get height {
    num statusBar = Platform.isAndroid ? 24 : 44;
    num bottomBar = 0;
    num screenHeight = Device.height - statusBar - bottomBar;
    return screenHeight;
  }

  ///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
  double get h => ((this * width) / figmaDesignWidth);

  ///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
  double get v => (this * height) / (figmaDesignHeight - figmaDesignStatusBar);

  ///This method is used to set smallest px in image height and width
  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  ///This method is used to set text font size according to Viewport
  double get fSize => adaptSize;
}

extension FormatExtension on double {
  /// Return a [double] value with formatted according to provided fractionDigits
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }
}
