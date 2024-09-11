import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/text_failed/drop_down_custom_textfailed.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.hintText,
    this.dropdownItems,
    this.onDropdownChanged,
    this.icon,
  });

  final String? hintText;
  final List<String>? dropdownItems;
  final Function(String?)? onDropdownChanged;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.white,
        child: DropDownCustomTextfailed(
        //  suffixIcon: const Icon(Icons.arrow_drop_down),
          prefixIcon: Icon(
            icon,
            color: Colors.blue,
          ),
          hintText: hintText,
          dropdownItems: dropdownItems,
          onDropdownChanged: onDropdownChanged,
        ),
      ),
    );
  }
}