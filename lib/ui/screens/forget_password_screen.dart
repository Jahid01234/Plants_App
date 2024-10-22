import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plants_app/resources/colors/app_colors.dart';
import 'package:plants_app/ui/screens/sign_in_screen.dart';
import 'package:plants_app/ui/screens/sign_up_screen.dart';
import 'package:plants_app/ui/widgets/custom_elevated_button.dart';
import 'package:plants_app/ui/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    // 1st Image part
                    Image.asset("assets/images/reset-password.png"),
                    // 2nd Forget Password Text part
                    const Text("Forget Password", style: TextStyle(
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
                      title: "Reset Password",
                      bgColor: AppColors.primaryColor.withOpacity(0.8),
                    ),
                    const SizedBox(height: 10),
                    // 5th Forget button part
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Have an Account? ',
                          style: const TextStyle(
                              color: AppColors.blackColor
                          ),
                          children: [
                            TextSpan(
                                text: 'Sign Up',
                                style: const TextStyle(
                                    color: AppColors.primaryColor
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (){
                                    Navigator.pushReplacement(context, PageTransition(
                                      child: const SignUpScreen(),
                                      type: PageTransitionType.bottomToTop,
                                    ),
                                    );
                                  },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}



