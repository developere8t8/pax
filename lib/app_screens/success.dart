import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:pax_television/app_screens/auth.dart';

import 'package:pax_television/widgets/bottom_bar.dart';
import 'package:pax_television/widgets/buttons.dart';

import '../colors.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: gradientBlue,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 375.w,
                height: 464.h,
                decoration: BoxDecoration(
                  gradient: gradientGolden,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 70.h),
                    Row(
                      children: [
                        SizedBox(width: 30.w),
                        IconButton(
                          onPressed: () {
                            //closing context
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: colorWhite,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 30.w),
                        Image.asset(
                          'assets/icons/pax_white.png',
                          width: 159.w,
                          height: 64.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 45.h),
                    Image.asset(
                      'assets/icons/success.png',
                      width: 117,
                      height: 117,
                    ),
                    SizedBox(height: 35.h),
                    Text(
                      'Payment Successful',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700,
                        color: colorWhite,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Your Transaction has been\nSuccessfull!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: colorWhite,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: 339.w,
                height: 316.h,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 2, color: primaryGolden),
                    right: BorderSide(width: 2, color: primaryGolden),
                    bottom: BorderSide(width: 2, color: primaryGolden),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 53.h),
                    Text(
                      'You are now one step away\nfrom enjoying your favourite\nshows.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: colorWhite,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    FixedPrimary(
                        buttonText: 'Next',
                        ontap: () {
                          openDialog();

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomBar(
                                        page: 0,
                                      )));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Builder(
            builder: (context) {
              return Container(
                height: 204.h,
                width: 223.w,
                decoration: BoxDecoration(
                  gradient: gradientGolden,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Image.asset(
                      'assets/icons/success.png',
                      scale: 10,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Success',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: colorWhite,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Mattis\nconsectetur sit senectus.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: colorWhite,
                      ),
                    ),
                    SizedBox(height: 11.h),
                    AlertButton(
                        buttonText: 'Button', ontap: () {}, color1: colorWhite, color2: primaryBlue),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
