import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medhavi_app/core/utils/size/size_utils.dart';

class SvgViewer {
  const SvgViewer._();
  static fromAsset({
    required String path,
    ColorFilter? colorFilter,
    String? semanticsLabel,

    /// if [size] is given then height and width are equal
    double? size,

    /// if [height] and [width] is given then [size] is ignored
    double? height,

    /// if [height] and [width] is given then [size] is ignored
    double? width,
  }) {
    return height != null && width != null
        ? SvgPicture.asset(
            path,
            colorFilter: colorFilter,
            semanticsLabel: semanticsLabel,
            height: height,
            width: width,
          )
        : SizedBox.square(
            dimension: size ?? 30.adaptSize,
            child: SvgPicture.asset(
              path,
              colorFilter: colorFilter,
              semanticsLabel: semanticsLabel,
            ),
          );
  }

  static fromNetwork({
    required String path,
    ColorFilter? colorFilter,
    String? semanticsLabel,
    double? size,
  }) {
    return SizedBox.square(
      dimension: size ?? 30.adaptSize,
      child: SvgPicture.network(
        path,
        colorFilter: colorFilter,
        semanticsLabel: semanticsLabel,
        placeholderBuilder: (BuildContext context) => Container(
          padding: EdgeInsets.all(30.0.adaptSize),
          child: const CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
