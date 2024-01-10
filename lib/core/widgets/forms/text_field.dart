import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medhavi_app/core/constants/nums.dart';
import 'package:medhavi_app/core/utils/extensions/context_extension.dart';
import 'package:medhavi_app/core/utils/extensions/num_extension.dart';
import 'package:medhavi_app/core/utils/extensions/theme_extensions.dart';
import 'package:medhavi_app/core/utils/size/size_utils.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isRequired = false,
    this.maxLines,
    this.textEditingController,
    this.initialValue,
    this.errorText,
    this.keyboardtype,
    this.focusNode,
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.maxLength,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
    this.autoFocus,
    this.readOnly,
    this.onTap,
    this.onSaved,
    this.isObscure,
    this.keyboardType,
    required this.label,
    this.hinText,
    this.obscureText = false,
    this.required = false,
    this.labelStyle,
    this.fillColor,
    this.borderSideColor,
    this.alignLableWithHint,
    this.hintTextStyle,
    this.minLines,
  });

  final bool isRequired;
  final int? maxLines;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final String? errorText;
  final TextInputType? keyboardtype;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final int? maxLength;
  final bool? readOnly;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final bool? isObscure;

  final TextInputType? keyboardType;
  final String label;
  final String? hinText;
  final TextStyle? hintTextStyle;
  final bool obscureText;
  final bool required;
  final TextStyle? labelStyle;
  final Color? fillColor;
  final Color? borderSideColor;
  final bool? alignLableWithHint;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.deviceHeight * .3,
        minHeight: 0,
      ),
      child: TextFormField(
        initialValue: initialValue,
        controller: textEditingController,
        obscureText: isObscure ?? false,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        cursorColor: context.theme.accent,
        keyboardType: keyboardtype,
        focusNode: focusNode,
        validator: validator,
        decoration: InputDecoration(
          alignLabelWithHint: alignLableWithHint,
          counterText: '',
          prefixIcon: prefixIcon,
          label: Wrap(
            spacing: 2,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                label,
                style: labelStyle ?? context.textTheme.labelSmall,
              ),
              if (required)
                Text(
                  '*',
                  style: context.textTheme.labelSmall
                      ?.copyWith(color: context.theme.negative),
                ),
            ],
          ),
          // prefixIcon: Icon(Icons.email),
          filled: true,
          fillColor: fillColor ?? context.theme.backgroundPrimary,
          hintText: hinText,
          hintStyle: hintTextStyle ??
              context.textTheme.bodyMedium
                  ?.copyWith(color: context.theme.contentTeritiary),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderSideColor ?? context.theme.contentTeritiary!,
                width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),

          focusColor: context.theme.accent,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.accent!, width: 1.0),
            borderRadius: BorderRadius.all(AppScales.mediumRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.negative!, width: 1.0),
            borderRadius: BorderRadius.all(AppScales.mediumRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: context.theme.contentTeritiary!.withOpacity(0.5),
                width: 1.0),
            borderRadius: BorderRadius.all(AppScales.mediumRadius),
          ),

          iconColor: context.theme.contentTeritiary,

          suffixIconConstraints: BoxConstraints(
            maxHeight: 25,
            maxWidth: context.deviceWidth * .12,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: suffixIcon,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 25,
            maxWidth: context.deviceHeight * .12,
          ),
          prefixIconColor: context.theme.contentTeritiary,
          suffixIconColor: context.theme.contentTeritiary,

          error: errorText != null
              ? Row(
                  children: [
                    Icon(
                      CupertinoIcons.exclamationmark_circle,
                      size: 20.0,
                      color: context.theme.negative,
                    ),
                    8.h.horizontalSpace,
                    Text(
                      errorText ?? '',
                      style: TextStyle(
                        color: context.theme.contentTeritiary,
                      ),
                    )
                  ],
                )
              : null,
        ),
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
        autofocus: autoFocus ?? false,
        maxLength: maxLength,
        readOnly: readOnly ?? false,
        onSaved: onSaved,
        onTap: onTap,
      ),
    );
  }
}
