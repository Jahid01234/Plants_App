import 'package:flutter/material.dart';
import 'package:plants_app/resources/colors/app_colors.dart';

class AppBarWithScanScreen extends StatelessWidget {
  final IconData icon;
  final VoidCallback ontap;

  const AppBarWithScanScreen({
    super.key,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}