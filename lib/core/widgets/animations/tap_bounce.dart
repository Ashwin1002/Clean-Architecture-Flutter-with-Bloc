import 'package:flutter/cupertino.dart';
import 'package:medhavi_app/core/core.dart';
import 'package:medhavi_app/core/widgets/buttons/tap_debouncer/tap_debouncer.dart';

class TapBouncerWidget extends StatefulWidget {
  const TapBouncerWidget({
    super.key,
    this.iconData,
    this.label = '',
    this.showIcon = true,
    this.iconAssetPath,
    this.onPressedEvent,
    this.showShadow,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.boxShape,
    this.child,
    this.textColor,
    this.textStyle,
    this.trailing,
  });

  final double? height;
  final IconData? iconData;
  final String label;
  final bool showIcon;
  final String? iconAssetPath;
  final VoidCallback? onPressedEvent;
  final bool? showShadow;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final BoxShape? boxShape;
  final Widget? child;
  final Color? textColor;
  final TextStyle? textStyle;
  final Widget? trailing;

  @override
  State<TapBouncerWidget> createState() => _TapBouncerWidgetState();
}

class _TapBouncerWidgetState extends State<TapBouncerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
  }

  late double _scale;

  @override
  void dispose() {
    ///remove the listener
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        _scale = 1 - _animationController.value;
        return Transform.scale(
          scale: _scale,
          child: child!,
        );
      },
      child: TapDebouncer(
        onTap: () async {
          await _animationController.forward();

          await _animationController.reverse();
          Future.delayed(
            const Duration(milliseconds: 100),
            () {
              if (widget.onPressedEvent != null) {
                widget.onPressedEvent!();
              }
            },
          );
        },
        builder: (context, onTap) {
          return GestureDetector(
            onTap: onTap,
            child: DecoratedBox(
              decoration: CustomDecoration.containerDecoration(
                context,
                backgroundColor:
                    widget.backgroundColor ?? context.theme.backgroundPrimary,
                hasShadow: widget.showShadow ?? true,
                spreadRadius: -8,
                borderRadius: widget.borderRadius ??
                    BorderRadius.all(AppScales.largeRadius),
                boxShape: widget.boxShape,
              ),
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}

class _CustomAnimatedButtonWidget extends StatelessWidget {
  const _CustomAnimatedButtonWidget({
    required this.showIcon,
    required this.iconData,
    required this.iconAssetPath,
    required this.label,
    required this.height,
    required this.textColor,
    required this.textStyle,
    this.trailing,
  });

  final bool showIcon;
  final IconData iconData;
  final String iconAssetPath;
  final String label;
  final double height;
  final Color textColor;
  final TextStyle textStyle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Row(
        children: [
          if (showIcon)
            Icon(
              iconData,
              size: 26.0,
            ),
          if (iconAssetPath.isNotEmpty)
            Image.asset(
              iconAssetPath,
              height: 24,
              width: 24,
            ),
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
          trailing ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
