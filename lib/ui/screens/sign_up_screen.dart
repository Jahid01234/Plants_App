import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plants_app/resources/colors/app_colors.dart';
import 'package:plants_app/ui/screens/forget_password_screen.dart';
import 'package:plants_app/ui/screens/main_bottom_nav_screen.dart';
import 'package:plants_app/ui/screens/sign_in_screen.dart';
import 'package:plants_app/ui/widgets/custom_elevated_button.dart';
import 'package:plants_app/ui/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText1 = true;
  bool _obscureText2 = true;// for hidden

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: SingleChildScrollView(
            child: Form (
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1st Image part
                  Image.asset("assets/images/signup.png"),
                  // 2nd Sign In Text part
                  const Text("Sign Up", style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 30),
                  // 3rd TextForm field part
                   CustomTextFormField(
                     controller: _emailController,
                     validator: (String? value) {
                       if (value == null || value.isEmpty) {
                         return 'Please enter your email';
                       }
                       else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                         return 'Please enter a valid email address';
                       }
                       return null;
                     },
                     keyboardType: TextInputType.text,
                     hintText: "Enter your email",
                     prefixIcon: Icons.email,
                   ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    obscureText: _obscureText1,
                    controller: _passwordController,
                    validator: (String? value){
                      if(value==null || value.isEmpty){
                        return "Please enter password";
                      }
                      else if(value.length<=8){
                        return " please enter 8 character";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Enter your password",
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                      onPressed: (){
                        _obscureText1 = !_obscureText1;
                        setState(() {});
                      },
                      icon: Icon( _obscureText1
                          ? Icons.visibility
                          : Icons.visibility_off,
                        color: AppColors.blackColor.withOpacity(0.3),
                      ),
                    ) ,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    obscureText: _obscureText2,
                    controller: _confirmPasswordController,
                    validator: (String? value){
                      if(value==null || value.isEmpty){
                        return "Please enter confirm password";
                      }
                      else if(value.length<=8){
                        return " please enter 8 character";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Enter your confirm password",
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                      onPressed: (){
                        _obscureText2 = !_obscureText2;
                        setState(() {});
                      },
                      icon: Icon( _obscureText2
                          ? Icons.visibility
                          : Icons.visibility_off,
                        color: AppColors.blackColor.withOpacity(0.3),
                      ),
                    ) ,
                  ),
                  const SizedBox(height: 20),
                  // 4th Elevated Button part
                  CustomElevatedButton(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        Navigator.pushReplacement(context, PageTransition(
                          child: const SignInScreen(),
                          type: PageTransitionType.bottomToTop,
                          ),
                        );
                      }
                    },
                    title: "Sign Up",
                    bgColor: AppColors.primaryColor.withOpacity(0.8),
                  ),
                  const SizedBox(height: 10),
                  // 5th sing In screen button part
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(
                            color: AppColors.blackColor
                        ),
                        children: [
                          TextSpan(
                              text: 'Sign In',
                              style: const TextStyle(
                                  color: AppColors.primaryColor
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = (){
                                  Navigator.pushReplacement(context, PageTransition(
                                    child: const SignInScreen(),
                                    type: PageTransitionType.bottomToTop,
                                   ),
                                  );
                                },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 6th OR text part
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(color: AppColors.blackColor,),
                      ),
                      Text("OR"),
                      Expanded(
                        child: Divider(color: AppColors.blackColor,),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // 7th Sign in Google Button part
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/google.png",height: 26),
                        const SizedBox(width: 5),
                        const Text(
                            "Sign in with Google",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 18,
                            ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}


