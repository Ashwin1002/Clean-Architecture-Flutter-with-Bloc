import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:medhavi_app/core/core.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.hasShadow = false,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.padding,
    this.iconPath = '',
    this.borderRadius,
  })  : isOutlined = false,
        isBorderless = false;

  final String label;
  final VoidCallback? onTap;
  final bool isOutlined;
  final bool isBorderless;
  final bool hasShadow;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final String iconPath;
  final BorderRadius? borderRadius;

  const CustomButton.outlined({
    super.key,
    required this.onTap,
    this.borderRadius,
    this.label = '',
    this.bgColor,
    this.borderColor,
    this.padding,
    this.textColor,
    this.iconPath = '',
  })  : isOutlined = true,
        hasShadow = false,
        isBorderless = false;

  const CustomButton.icon({
    super.key,
    required this.onTap,
    this.borderRadius,
    this.label = '',
    this.padding,
    required this.iconPath,
    this.textColor,
    this.bgColor,
  })  : hasShadow = true,
        isBorderless = false,
        isOutlined = false,
        borderColor = null;

  const CustomButton.borderless({
    super.key,
    required this.onTap,
    this.borderRadius,
    this.label = 'Submit',
    this.textColor,
    this.padding,
    this.bgColor,
  })  : hasShadow = false,
        isBorderless = true,
        isOutlined = false,
        iconPath = '',
        borderColor = null;

  bool get isBorderlessSelected => isBorderless && !hasShadow && !isOutlined;

  bool get isIconSelected => hasShadow && !isBorderless && !isOutlined;

  @override
  Widget build(BuildContext context) {
    return TapBouncerWidget(
      onPressedEvent: onTap,
      showShadow: hasShadow,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 14.v),
        decoration: CustomDecoration.containerDecoration(
          context,
          backgroundColor: isOutlined || isBorderlessSelected || isIconSelected
              ? context.theme.backgroundPrimary
              : bgColor ?? context.theme.accent,
          border: isOutlined
              ? Border.all(
                  color: borderColor ??
                      context.theme.borderOpaque!.withOpacity(.4),
                  width: 1.2,
                )
              : null,
          borderRadius:
              borderRadius ?? BorderRadius.all(AppScales.mediumRadius),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath.isNotEmpty) ...[
              SvgViewer.fromAsset(path: iconPath, size: 20.adaptSize),
              10.h.horizontalSpace,
            ],
            Text(
              label.tr(),
              style: context.textTheme.labelMedium?.copyWith(
                color: isOutlined
                    ? (bgColor ?? context.theme.contentPrimary)
                    : iconPath.isNotEmpty || isBorderless
                        ? context.theme.primaryA
                        : textColor ?? context.theme.contentInversePrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
