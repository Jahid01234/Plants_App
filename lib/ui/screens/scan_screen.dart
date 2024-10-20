import 'package:flutter/material.dart';
import 'package:plants_app/resources/colors/app_colors.dart';
import 'package:plants_app/ui/widgets/app_bar_with_scan_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarWithScanScreen(
                ontap: (){
                  Navigator.pop(context);
                },
                icon: Icons.close,
              ),
              AppBarWithScanScreen(
                ontap: (){
                  Navigator.pop(context);
                },
                icon: Icons.share,
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/code-scan.png",height: 120,),
              const SizedBox(height: 8),
              const Text(
                "Tap to scan",
                style: TextStyle(
                   color: AppColors.blackColor,
                   fontSize: 20,
                   fontWeight: FontWeight.w400,
               ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


