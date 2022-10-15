import 'package:flutter/material.dart';
import 'package:mega_store/shared/app_colors.dart';

// ignore: must_be_immutable
class MyFormField extends StatelessWidget {
  final String hint;
  final IconData prefix;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final TextInputType inputType;
  IconData? suffix;
  bool? isPassword;
  VoidCallback? suffixPress;

  MyFormField({
    super.key,
    required this.hint,
    required this.prefix,
    required this.controller,
    required this.validate,
    required this.inputType,
    this.suffix,
    this.isPassword,
    this.suffixPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ?? false,
      validator: validate,
      keyboardType: inputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.grey.withOpacity(.5),
          ),
        ),
        labelText: hint,
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
          icon: Icon(suffix),
          onPressed: suffixPress,
        ),
      ),
    );
  }
}
