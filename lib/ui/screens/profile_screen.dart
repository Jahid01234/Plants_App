import 'package:flutter/material.dart';
import 'package:plants_app/resources/colors/app_colors.dart';
import 'package:plants_app/ui/widgets/profile_component.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // profile image
              Container(
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    width: 2.0,
                  ),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/profile.png"),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Name, email text
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Text("Md. Jahid Hasan",
                        style: TextStyle(
                          color: AppColors.primaryColor.withOpacity(0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Image.asset("assets/images/verified.png",height: 20,),
                    ],
                  ),
                  const Text("mdjahidhasan790523@gmail.com",
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    ProfileComponent(
                      title: 'My Profile',
                      icon: Icons.person,
                    ),
                  ProfileComponent(
                    title: 'Setting',
                    icon: Icons.settings,
                  ),
                  ProfileComponent(
                    title: 'Notifications',
                    icon: Icons.notifications,
                  ),
                  ProfileComponent(
                    title: 'Chat',
                    icon: Icons.chat,
                  ),
                  ProfileComponent(
                    title: 'Share',
                    icon: Icons.share,
                  ),
                  ProfileComponent(
                    title: 'Log Out',
                    icon: Icons.logout,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}


