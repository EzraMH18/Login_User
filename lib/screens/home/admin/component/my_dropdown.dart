import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  const MyDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: PopupProps.menu(
        showSelectedItems: true,
        disabledItemFn: (String s) => s.startsWith('I'),
      ),
      items: [
        "Lowest",
        "Highest",
      ],
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: "Price",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      onChanged: print,
      selectedItem: "Price",
    );
  }
}
//DropdownButtonHideUnderline(child: Container(decoration: BoxDecoration(),))