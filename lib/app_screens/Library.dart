import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pax_television/app_screens/genre_name.dart';
import 'package:pax_television/colors.dart';
import 'package:pax_television/widgets/drawer.dart';

import '../widgets/buttons.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
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
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 1750.h,
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
                      'Library',
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
                left: 32.w,
                child: Image.asset('assets/images/home4.png',
                    width: 311.w, height: 180.h),
              ),
              Positioned(
                top: 80.h,
                left: 24.w,
                child: Image.asset('assets/images/home3.png',
                    width: 327.w, height: 190.h),
              ),
              Positioned(
                top: 90.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 196.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/vk.png',
                    )),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 62.h),
                      Text(
                        'Top Pick / Recommended\nViewing',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: colorWhite,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      FixedBlur(
                          buttonText: 'Explore',
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GenreName(),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 346.h,
                left: 32.w,
                child: Image.asset('assets/images/home4.png',
                    width: 311.w, height: 180.h),
              ),
              Positioned(
                top: 352.h,
                left: 24.w,
                child: Image.asset('assets/images/home3.png',
                    width: 327.w, height: 190.h),
              ),
              Positioned(
                top: 362.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 196.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/home4.png',
                    )),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 90.h),
                      Text(
                        'Local Programs',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: colorWhite,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      FixedBlur(
                          buttonText: 'Explore',
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GenreName(),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 618.h,
                left: 32.w,
                child: Image.asset('assets/images/home4.png',
                    width: 311.w, height: 180.h),
              ),
              Positioned(
                top: 624.h,
                left: 24.w,
                child: Image.asset('assets/images/home3.png',
                    width: 327.w, height: 190.h),
              ),
              Positioned(
                top: 634.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 196.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/L7.png',
                    )),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 90.h),
                      Text(
                        'Drama',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: colorWhite,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      FixedBlur(
                          buttonText: 'Explore',
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GenreName(),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 890.h,
                left: 32.w,
                child: Image.asset('assets/images/home4.png',
                    width: 311.w, height: 180.h),
              ),
              Positioned(
                top: 896.h,
                left: 24.w,
                child: Image.asset('assets/images/home3.png',
                    width: 327.w, height: 190.h),
              ),
              Positioned(
                top: 906.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 196.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/L3.png',
                    )),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 90.h),
                      Text(
                        'Kids / Family',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: colorWhite,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      FixedBlur(
                          buttonText: 'Explore',
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GenreName(),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 1162.h,
                left: 32.w,
                child: Image.asset('assets/images/home4.png',
                    width: 311.w, height: 180.h),
              ),
              Positioned(
                top: 1168.h,
                left: 24.w,
                child: Image.asset('assets/images/home3.png',
                    width: 327.w, height: 190.h),
              ),
              Positioned(
                top: 1178.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 196.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/L2.png',
                    )),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 90.h),
                      Text(
                        'Documentaries',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: colorWhite,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      FixedBlur(
                          buttonText: 'Explore',
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GenreName(),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 1434.h,
                left: 32.w,
                child: Image.asset('assets/images/home4.png',
                    width: 311.w, height: 180.h),
              ),
              Positioned(
                top: 1440.h,
                left: 24.w,
                child: Image.asset('assets/images/insp.png',
                    width: 327.w, height: 190.h),
              ),
              Positioned(
                top: 1450.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 196.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      'assets/images/vk.png',
                    )),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 90.h),
                      Text(
                        'Inspirational',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: colorWhite,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      FixedBlur(
                          buttonText: 'Explore',
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GenreName(),
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
    );
  }
}
