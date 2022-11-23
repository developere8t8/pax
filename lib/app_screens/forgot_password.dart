import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pax_television/app_screens/auth.dart';
import 'package:pax_television/app_screens/login.dart';
import 'package:pax_television/widgets/buttons.dart';
import 'package:pax_television/widgets/text_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();
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
              Container(height: 800.h),
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
                  height: 737.h,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: primaryGolden),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                          'Forgot Password',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: primaryGolden,
                          ),
                        ),
                        SizedBox(height: 13.h),
                        Text(
                          'Please enter your email and a notification link to reset your password will be sent to you inbox',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            color: colorWhite,
                          ),
                        ),
                        SizedBox(height: 58.h),
                        TextFieldWidget(
                          hintText: 'Email Address',
                          controller: email,
                        ),
                        SizedBox(height: 83.h),
                        FixedPrimary(
                            buttonText: 'Submit',
                            ontap: () async {
                              if (email.text.isNotEmpty) {
                                await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
                                QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.info,
                                    title: 'Email sent',
                                    text: 'A password reset link has been sent to your email');
                              }
                            }),
                      ],
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
}
