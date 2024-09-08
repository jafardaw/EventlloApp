// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.maxLength,
    this.keyboardType,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.prefixIcon,
    this.label,
    this.hintStyle,
    this.controller,
    required String hint,
    this.suffixIcon,
    this.validator,
    this.obscuringCharacter = '*',
  });
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? hintText;
  final bool? obscureText;
  final Text? label;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final int? maxLength;
  final String? Function(String?)? validator;
  final String obscuringCharacter;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: obscuringCharacter,
      maxLength: maxLength,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText!,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: label,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: buildBorder(Colors.purple),
        border: buildBorder(Colors.purple),
        focusedBorder: buildBorder(Colors.purple),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? Colors.black12),
    );
  }
}
