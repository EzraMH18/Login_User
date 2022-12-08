import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MySearchField extends StatelessWidget {
  final String name;
  final String? hint;
  final Widget? preffixIcon;
  final bool isFilled;
  const MySearchField(
    this.name, {
    Key? key,
    this.hint,
    this.isFilled = true,
    this.preffixIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        filled: isFilled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hint,
        prefixIcon: preffixIcon,
      ),
    );
  }
}
