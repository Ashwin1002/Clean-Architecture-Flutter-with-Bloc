import 'package:flutter/material.dart';
import 'package:medhavi_app/core/utils/extensions/theme_extensions.dart';
import 'package:medhavi_app/core/utils/size/size_utils.dart';

class CustomDecoration {
  const CustomDecoration._();

  static containerDecoration(
    BuildContext context, {
    Color? backgroundColor,
    BorderRadius? borderRadius,
    BoxBorder? border,
    BoxShape? boxShape,
    Gradient? gradient,
    DecorationImage? decorationImage,

    /// enable or disable shadow
    bool hasShadow = false,

    /// inset inverse the shadow making concave and covex shapes
    ///hasShadow property must be set to [true] to use inset.
    bool inset = false,

    /// offset of the top right corner of the container shadow
    ///hasShadow property must be set to [true] to use inset
    /// default value [-Offset(5,5)],
    Offset? shadowOffsetTopLeft,

    /// offset of the bottom right corner of the container shadow
    ///hasShadow property must be set to [true] to use inset
    /// default value [Offset(5,5)],
    Offset? shadowOffsetBottomRight,

    /// shadow blur radius
    double blurRadius = 10,

    /// spread radius of shadow
    double spreadRadius = -2,
    Color? topShadowColor,
    Color? bottomShadowColor,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? context.theme.backgroundPrimary,
      borderRadius: boxShape == BoxShape.circle
          ? null
          : borderRadius ?? BorderRadius.circular(12.adaptSize),
      border: border,
      shape: boxShape ?? BoxShape.rectangle,
      gradient: gradient,
      image: decorationImage,
      boxShadow: hasShadow
          ? [
              BoxShadow(
                color: bottomShadowColor ?? context.theme.contentSecondary!,
                blurRadius: blurRadius,
                offset: shadowOffsetBottomRight ?? const Offset(5, 5),
                spreadRadius: spreadRadius,
              ),
              BoxShadow(
                color: topShadowColor ?? context.theme.backgroundPrimary!,
                blurRadius: blurRadius,
                offset: shadowOffsetTopLeft ?? -const Offset(5, 5),
                spreadRadius: spreadRadius,
              ),
            ]
          : null,
    );
  }
}
