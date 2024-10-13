import 'package:flutter/material.dart';
import 'package:plants_app/ui/screens/onboarding_screen.dart';

class PlantsApp extends StatelessWidget {
  const PlantsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Plants App',
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}