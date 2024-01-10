import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:medhavi_app/core/utils/extensions/context_extension.dart';
import 'package:medhavi_app/core/utils/extensions/num_extension.dart';
import 'package:medhavi_app/core/utils/extensions/theme_extensions.dart';
import 'package:medhavi_app/core/utils/size/size_utils.dart';
import 'package:medhavi_app/core/widgets/decoration/container_decoration.dart';

class CustomDropdownFieldWidget<T> extends StatelessWidget {
  const CustomDropdownFieldWidget({
    super.key,
    this.value,
    required this.items,
    this.onChanged,
    this.label = '',
    this.validator,
    this.hinText,
  });

  final String label;
  final String? hinText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonFormField2<T>(
          hint: Text(
            hinText ?? '',
            style: const TextStyle(),
          ),
          isExpanded: true,
          value: value,
          items: items,
          style: const TextStyle(),
          iconStyleData:
              const IconStyleData(icon: Icon(Icons.keyboard_arrow_down)),
          onChanged: onChanged,
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.only(
                left: 16, right: 12, top: 4.0, bottom: 4.0),
            height: 55,
            width: context.size?.width,
            decoration: CustomDecoration.containerDecoration(
              context,
              border: Border.all(color: context.theme.borderOpaque!),
              hasShadow: false,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          isDense: true,
          decoration: const InputDecoration.collapsed(hintText: ''),
          dropdownStyleData: DropdownStyleData(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
            maxHeight: context.deviceHeight * .22,
          ),
          menuItemStyleData: MenuItemStyleData(
            selectedMenuItemBuilder: (context, child) => Container(
              color: context.theme.backgroundAccent,
              child: Row(
                children: [
                  Expanded(
                    child: child,
                  ),
                  15.h.horizontalSpace,
                  Icon(
                    Icons.check_circle_outline_outlined,
                    color: context.theme.backgroundAccent,
                  ),
                  15.h.horizontalSpace,
                ],
              ),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}

DropdownMenuItem<T> myDropDownMenuItem<T>(
    {required T value, required String label}) {
  return DropdownMenuItem<T>(
    value: value,
    child: Text(
      label,
      style: label.toLowerCase().contains('select')
          ? const TextStyle()
          : const TextStyle(),
    ),
  );
}
