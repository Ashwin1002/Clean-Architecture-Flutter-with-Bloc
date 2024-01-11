import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medhavi_app/core/core.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key})
      : label = '',
        padding = EdgeInsets.zero;
  final String label;
  final EdgeInsetsGeometry? padding;

  const CustomDivider.label({super.key, this.padding, this.label = 'or'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: 20.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              color: context.theme.borderOpaque?.withOpacity(.45),
              thickness: 0.5,
            ),
          ),
          if (label.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: Text(
                label.tr(),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.theme.contentTeritiary,
                ),
              ),
            ),
          Expanded(
            child: Divider(
              color: context.theme.borderOpaque?.withOpacity(.45),
              thickness: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
