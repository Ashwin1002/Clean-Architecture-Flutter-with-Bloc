import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:medhavi_app/core/constants/colors.dart';
import 'package:medhavi_app/core/utils/extensions/context_extension.dart';
import 'package:medhavi_app/core/utils/extensions/double_extension.dart';
import 'package:medhavi_app/core/utils/size/size_utils.dart';
import 'package:medhavi_app/core/widgets/decoration/container_decoration.dart';

typedef DropdownDataModel<T> = T;

class CustomDropdownFieldWidget<DropdownDataModel> extends StatelessWidget {
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
  final DropdownDataModel? value;
  final List<DropdownMenuItem<DropdownDataModel>> items;
  final void Function(DropdownDataModel?)? onChanged;
  final String? Function(DropdownDataModel?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonFormField2<DropdownDataModel>(
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
              border: Border.all(color: AppColors.greyLight),
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
              color: AppColors.primaryLight,
              child: Row(
                children: [
                  Expanded(
                    child: child,
                  ),
                  15.h.horizontalSpace,
                  const Icon(
                    Icons.check_circle_outline_outlined,
                    color: AppColors.backgroundLight,
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
