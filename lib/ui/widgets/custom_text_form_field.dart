import 'package:flutter/material.dart';
import 'package:plants_app/resources/colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final String hintText;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    this.obscureText,
    this.suffixIcon,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.grey,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.blackColor.withOpacity(0.3),
         ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}