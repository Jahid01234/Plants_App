import 'package:flutter/material.dart';
import 'package:plants_app/resources/colors/app_colors.dart';
import 'package:plants_app/resources/strings/app_strings.dart';
import 'package:plants_app/ui/screens/login_screen.dart';
import 'package:plants_app/ui/widgets/create_onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions:  [
          Padding(
              padding: const EdgeInsets.only(top:20, right: 10),
              child: TextButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context)=> const LoginScreen(),
                   ),
                  );
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                  ),
                ),
              )
          ),
        ],
      ),

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // 1st PageView
          PageView(
            controller: _pageController,
            onPageChanged: (int page){
              currentIndex = page;
              setState(() {});
            },
            children: [
             CreateOnboardingPage(
                 image: 'assets/images/plant-one.png',
                 title: AppStrings.titleOne,
                 description: AppStrings.descriptionOne,
             ),
              CreateOnboardingPage(
                image: 'assets/images/plant-two.png',
                title: AppStrings.titleTwo,
                description: AppStrings.descriptionTwo,
              ),
              CreateOnboardingPage(
                image: 'assets/images/plant-three.png',
                title: AppStrings.titleThree,
                description: AppStrings.descriptionThree,
              ),
            ],
          ),

          // 2nd Indicator section
          Positioned(
            bottom: 70,
            left: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          
          // 3rd move to next page section
          Positioned(
            bottom: 50,
            right: 30,
            child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle
                ),
              child: IconButton(
                onPressed: (){
                  if(currentIndex < 2){
                    currentIndex++;
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                    );
                  } else{
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context)=> const LoginScreen(),
                      ),
                    );
                  }
                  setState(() {});
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Create the indicator decorations widget
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 10,
        width: isActive? 20 : 8,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
    );
  }

  //Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget>  indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
     return indicators;
  }

}


