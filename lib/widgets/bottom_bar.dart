// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pax_television/app_screens/Library.dart';
import 'package:pax_television/app_screens/home.dart';
import 'package:pax_television/app_screens/program_guide.dart';
import 'package:pax_television/app_screens/settings.dart';
import 'package:pax_television/colors.dart';

class BottomBar extends StatefulWidget {
  int? page;
  BottomBar({Key? key, this.page}) : super(key: key);

  @override
  State<BottomBar> createState() => _MainPageState();
}

class _MainPageState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List? _pages;

  @override
  void initState() {
    _pages = [
      //initlizing page
      Home(),
      Library(),
      ProgramGuide(),
      Settings(),
    ];
//setting page if not null

    _selectedIndex = widget.page ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: sized_box_for_whitespace
      bottomNavigationBar: SizedBox(
        height: 90.h,
        child: Container(
          decoration: BoxDecoration(
            gradient: gradientGolden,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedLabelStyle: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            unselectedLabelStyle: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            selectedItemColor: primaryBlue,
            unselectedItemColor: colorBlack,
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: 'Live'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.play), label: 'Library'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), label: 'Program Guide'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings'),
            ],
          ),
        ),
      ),
      body: _pages![_selectedIndex],
    );
  }
}
