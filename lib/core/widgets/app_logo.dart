import 'package:flutter/material.dart';
import 'package:medhavi_app/core/constants/images.dart';
import 'package:medhavi_app/core/utils/size/size_utils.dart';
import 'package:medhavi_app/core/widgets/svg_viewer.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgViewer.fromAsset(
      path: AssetList.appLogoNoBG,
      height: height ?? 56.v,
      width: width ?? 155.h,
    );
  }
}
