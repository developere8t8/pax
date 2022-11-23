import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pax_television/colors.dart';

import '../widgets/buttons.dart';

class GenreName extends StatefulWidget {
  const GenreName({super.key});

  @override
  State<GenreName> createState() => _GenreNameState();
}

class _GenreNameState extends State<GenreName> {
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
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 1650.h,
              ),
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
              Column(
                children: [
                  SizedBox(height: 23.h),
                  Center(
                    child: Text(
                      'Genre Name',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: primaryGolden,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 74.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 196.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/G1.png',
                    )),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 70.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vikings Valhalla',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: colorWhite,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '2019  |  Action,Fantasy',
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: uiLight4,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          FixedBlur(buttonText: 'Watch', ontap: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 330.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 196.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/G2.png',
                    )),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 70.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The 100',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: colorWhite,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '2019  |  Action,Fantasy',
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: uiLight4,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          FixedBlur(buttonText: 'Watch', ontap: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 586.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 196.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/G3.png',
                    )),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 70.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Peaky Blinders',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: colorWhite,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '2019  |  Action,Fantasy',
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: uiLight4,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          FixedBlur(buttonText: 'Watch', ontap: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 842.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 196.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/G4.png',
                    )),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 70.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The Equalizer',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: colorWhite,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '2019  |  Action,Fantasy',
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: uiLight4,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          FixedBlur(buttonText: 'Watch', ontap: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 1098.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 196.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/G5.png',
                    )),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 70.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dahmer',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: colorWhite,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '2019  |  Action,Fantasy',
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: uiLight4,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          FixedBlur(buttonText: 'Watch', ontap: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 1354.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 196.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/G6.png',
                    )),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 70.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'A Beautiful Mind',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: colorWhite,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '2019  |  Action,Fantasy',
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: uiLight4,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          FixedBlur(buttonText: 'Watch', ontap: () {}),
                        ],
                      ),
                    ],
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
