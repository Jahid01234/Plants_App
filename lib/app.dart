import 'package:flutter/material.dart';
import 'package:plants_app/ui/screens/main_bottom_nav_screen.dart';
import 'package:plants_app/ui/screens/sign_in_screen.dart';

class PlantsApp extends StatelessWidget {
  const PlantsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plants App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      //home: const OnboardingScreen(),
      home: SignInScreen(),
      //home:MainBottomNavScreen()
    );
  }
}