import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pax_television/colors.dart';

import '../widgets/buttons.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    children: [
                      SizedBox(height: 23.h),
                      Text(
                        'Contact Us',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: primaryGolden,
                        ),
                      ),
                      SizedBox(height: 35.h),
                      SizedBox(
                        width: 339,
                        height: 132,
                        child: TextField(
                          maxLines: 6,
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: uiLight4,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide:
                                  const BorderSide(color: uiLight4, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide:
                                  const BorderSide(color: uiLight4, width: 1),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            hintText: 'Your Message Here...',
                            hintStyle: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: uiLight4,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 37.h),
                      FixedPrimary(buttonText: 'Submit', ontap: () {}),
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
