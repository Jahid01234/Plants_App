import 'package:flutter/material.dart';
import 'package:plants_app/resources/colors/app_colors.dart';

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;

  const PlantFeature({
    super.key,
    required this.plantFeature,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.blackColor,
          ),
        ),
        Text(
          plantFeature,
          style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}