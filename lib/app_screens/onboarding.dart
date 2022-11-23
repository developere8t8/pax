import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pax_television/app_screens/create_profile.dart';
import 'package:pax_television/app_screens/login.dart';
import 'package:pax_television/app_screens/select_plan.dart';
import 'package:pax_television/widgets/buttons.dart';

import '../colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_pic.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: gradientBlue,
          ),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(height: 800),
                Positioned(
                  top: 235.h,
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
                    child: Column(
                      children: [
                        SizedBox(height: 61.h),
                        Image.asset(
                          'assets/images/pax_logo_1.png',
                          width: 159.w,
                          height: 64.h,
                        ),
                        SizedBox(height: 64.h),
                        Text(
                          'Watch TV Shows and Movies Anytime and Anywhere',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            color: colorWhite,
                          ),
                        ),
                        SizedBox(height: 240.h),
                        FixedBlur(
                            buttonText: 'Sign in',
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            }),
                        SizedBox(height: 25.h),
                        FixedPrimary(
                            buttonText: 'Sign up',
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectPlan(),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
