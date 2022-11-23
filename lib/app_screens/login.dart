import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pax_television/app_screens/auth.dart';
import 'package:pax_television/app_screens/forgot_password.dart';
import 'package:pax_television/app_screens/home.dart';
import 'package:pax_television/widgets/bottom_bar.dart';
import 'package:pax_television/widgets/buttons.dart';
import 'package:pax_television/widgets/text_field.dart';
import 'package:quickalert/quickalert.dart';
import '../colors.dart';
import 'onboarding.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: gradientBlue,
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 800.h,
              ),
              Positioned(
                top: 255.h,
                left: 30.w,
                child: Image.asset(
                  'assets/images/obj_logo.png',
                  width: 325.w,
                  height: 272.h,
                  color: colorWhite.withOpacity(0.30),
                ),
              ),
              Positioned(
                top: 43.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 750.h,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: primaryGolden),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            SizedBox(height: 35.h),
                            Image.asset(
                              'assets/images/pax_logo_1.png',
                              width: 159.w,
                              height: 64.h,
                            ),
                            SizedBox(height: 50.h),
                            Text(
                              'Log in',
                              style: TextStyle(
                                fontFamily: 'Helvetica',
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: primaryGolden,
                              ),
                            ),
                            SizedBox(height: 50.h),
                            TextFieldWidget(
                              controller: emailC,
                              hintText: 'Email Address',
                              validate: true,
                              errortext: 'Enter Email',
                            ),
                            SizedBox(height: 30.h),
                            TextFieldWidget(
                              controller: passwordC,
                              hintText: 'Password',
                              obscureText: true,
                              validate: true,
                              errortext: 'Enter Password ',
                            ),
                            SizedBox(height: 56.h),
                            FixedPrimary(
                                buttonText: 'Log in',
                                ontap: () {
                                  if (formkey.currentState!.validate()) {
                                    Login();
                                  }
                                }),
                            SizedBox(height: 16.h),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ForgotPassword(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: primaryGolden,
                                ),
                              ),
                            ),
                            SizedBox(height: 180.h),
                            Wrap(
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: primaryGolden,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const OnBoarding(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'Helvetica',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: primaryGolden,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future Login() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailC.text, password: passwordC.text);

      Navigator.push(context, MaterialPageRoute(builder: (context) => Auth()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Email not registered yet');
      } else if (e.code == 'wrong-password') {
        QuickAlert.show(
            context: context, type: QuickAlertType.error, title: 'Oops...', text: 'Wrong Password');
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Some thing went wrong \n Please try again later');
      }
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'Some thing went wrong \n Please try again later');
    }
  }
}
