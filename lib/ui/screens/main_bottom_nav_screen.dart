import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plants_app/resources/colors/app_colors.dart';
import 'package:plants_app/ui/screens/cart_screen.dart';
import 'package:plants_app/ui/screens/favourite_screen.dart';
import 'package:plants_app/ui/screens/home_screen.dart';
import 'package:plants_app/ui/screens/profile_screen.dart';
import 'package:plants_app/ui/screens/scan_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _bottomNavIndex = 0;

  // List of widget
  List<Widget> pages = const [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Favourite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0,
         title: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(
               titleList[_bottomNavIndex],
               style: const TextStyle(
                 color: AppColors.blackColor,
                 fontSize: 24,
                 fontWeight: FontWeight.w500
               ),
             ),
              const Icon(
               Icons.notifications,
               color:AppColors.blackColor,
               size: 30,
             ),
           ],
         ),
       ),
       body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
       floatingActionButton: FloatingActionButton(
         backgroundColor: AppColors.primaryColor,
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(30),
         ),
         onPressed: (){
           Navigator.push(context, PageTransition(
               child: const ScanScreen(),
               type: PageTransitionType.bottomToTop,
             ),
           );
         },
         child: Image.asset(
           "assets/images/code-scan-two.png",
           height: 30,
         ),
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: AnimatedBottomNavigationBar(
         splashColor: AppColors.primaryColor,
         activeColor: AppColors.primaryColor,
         inactiveColor: Colors.black.withOpacity(0.5),
         gapLocation: GapLocation.center,
         notchSmoothness: NotchSmoothness.softEdge,
         icons: iconList,
         activeIndex: _bottomNavIndex,
         onTap: (index){
           _bottomNavIndex  = index;
           setState(() {});
         },
       ),

    );
  }
}
