import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pax_television/app_screens/create_profile.dart';
import 'package:pax_television/app_screens/create_profile_free.dart';

import 'package:pax_television/widgets/buttons.dart';

import '../colors.dart';

class SelectPlan extends StatefulWidget {
  const SelectPlan({super.key});

  @override
  State<SelectPlan> createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan> {
  @override
  void initState() {
    super.initState();
  }

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
                Container(
                  height: 800,
                ),
                Positioned(
                  top: 245.h,
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
                        SizedBox(height: 35.h),
                        Image.asset(
                          'assets/images/pax_logo_1.png',
                          width: 159.w,
                          height: 64.h,
                        ),
                        SizedBox(height: 44.h),
                        Text(
                          'Sign up today for unlimited access\nto our entire library for one low\nmonthly payment',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: colorWhite,
                          ),
                        ),
                        SizedBox(height: 58.h),
                        Image.asset(
                          'assets/images/month.png',
                          width: 217.w,
                          height: 84.h,
                        ),
                        SizedBox(height: 58.h),
                        FixedPrimary(
                            buttonText: 'Next',
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CreateProfile(),
                                ),
                              );
                            }),
                        SizedBox(height: 41.h),
                        Text(
                          'Or',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: colorWhite,
                          ),
                        ),
                        SizedBox(height: 41.h),
                        Text(
                          'Continue with free subscription instead!',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: colorWhite,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        FixedBlur(
                            buttonText: 'Sign up for free',
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CreateProfileFree(),
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
