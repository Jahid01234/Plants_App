import 'package:flutter/material.dart';
import 'package:plants_app/resources/colors/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color? bgColor;

  const CustomElevatedButton({
    super.key,
    this.bgColor,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? AppColors.primaryColor.withOpacity(0.4),
          foregroundColor: Colors.white,
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
          ),
      ),
      onPressed: onTap,
      child:  Text(title),
    );
  }
}