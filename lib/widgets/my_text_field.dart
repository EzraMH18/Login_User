import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MyTextField extends StatelessWidget {
  final String name;
  final String? label;
  final String? hint;
  final bool isObscureText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final List<String? Function(String?)>? validators;
  final Function(String?)? onChanged;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final String? initialValue;
  const MyTextField(this.name,
      {Key? key,
      this.label,
      this.hint,
      this.isObscureText = false,
      this.keyboardType = TextInputType.text,
      this.textCapitalization = TextCapitalization.none,
      this.validators,
      this.onChanged,
      this.suffixIcon,
      this.preffixIcon,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.black,
      obscureText: isObscureText,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        prefixIcon: preffixIcon,
        labelStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        hintText: hint,
      ),
      onChanged: onChanged,
    );
  }
}
