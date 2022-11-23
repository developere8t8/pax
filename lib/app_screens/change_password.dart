import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pax_television/colors.dart';

import '../widgets/buttons.dart';
import '../widgets/text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: primaryGolden,
                size: 20,
              )),
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
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      SizedBox(height: 23.h),
                      Text(
                        'Change Your Password',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: primaryGolden,
                        ),
                      ),
                      SizedBox(height: 46.h),
                      TextFieldWidget(
                        hintText: 'Existing Password',
                        obscureText: true,
                      ),
                      SizedBox(height: 25.h),
                      TextFieldWidget(
                        hintText: 'Create a Password*',
                        obscureText: true,
                      ),
                      SizedBox(height: 25.h),
                      TextFieldWidget(
                        hintText: 'Confirm Your Password*',
                        obscureText: true,
                      ),
                      SizedBox(height: 24.h),
                      Padding(
                        padding: EdgeInsets.only(right: 42.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '*Password Requirements',
                              style: TextStyle(
                                fontFamily: 'Helvetica',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: primaryGolden,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              '\u2022  must be 10 characters in length\n\u2022  must include at least one of the following:\n\n   \u2022  Special Character (*@#\$)\n   \u2022  Number\n   \u2022  Capital Letter',
                              style: TextStyle(
                                fontFamily: 'Helvetica',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: colorWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 156.h),
                      FixedPrimary(buttonText: 'Save changes', ontap: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
