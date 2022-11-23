import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pax_television/app_screens/auth.dart';
import 'package:pax_television/app_screens/change_password.dart';
import 'package:pax_television/app_screens/contact_us.dart';
import 'package:pax_television/app_screens/forgot_password.dart';
import 'package:pax_television/app_screens/update_profile.dart';
import 'package:pax_television/app_screens/update_subscription.dart';
import 'package:pax_television/colors.dart';
import 'package:pax_television/widgets/buttons.dart';
import 'package:pax_television/widgets/drawer.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: primaryBlue2,
          centerTitle: true,
          title: Image.asset(
            'assets/images/pax_appbar.png',
            width: 110.w,
            height: 45.h,
          ),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: gradientBlue,
          border: const Border(
            top: BorderSide(width: 2, color: primaryGolden),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 150.h,
              left: 30.w,
              child: Image.asset(
                'assets/images/obj_logo.png',
                width: 325.w,
                height: 272.h,
                color: colorWhite.withOpacity(0.30),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.5.w),
              child: Column(
                children: [
                  SizedBox(height: 60.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateProfile(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upgarde Profile',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: colorWhite,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 15, color: colorWhite),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const Divider(thickness: 0.5, color: colorWhite),
                  SizedBox(height: 30.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassword(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Change Password',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: colorWhite,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 15, color: colorWhite),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const Divider(thickness: 0.5, color: colorWhite),
                  SizedBox(height: 30.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateSubscription(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Update / Renew Subscription',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: colorWhite,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 15, color: colorWhite),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const Divider(thickness: 0.5, color: colorWhite),
                  SizedBox(height: 30.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactUs(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Contact Us',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: colorWhite,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 15, color: colorWhite),
                      ],
                    ),
                  ),
                  SizedBox(height: 200.h),
                  FixedPrimary(
                      buttonText: 'Log Out',

                      ontap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => Auth()));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  openDialog() => showDialog(
        barrierColor: null,
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Builder(
            builder: (context) {
              return Container(
                height: 204.h,
                width: 223.w,
                color: primaryBlue2,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Image.asset(
                      'assets/icons/success_alert.png',
                      scale: 3,
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
                        color: primaryGolden,
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
                        color: uiLight2,
                      ),
                    ),
                    SizedBox(height: 11.h),
                    AlertButton(
                        buttonText: 'Button',
                        ontap: () {},
                        color1: primaryGolden,
                        color2: colorWhite),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
