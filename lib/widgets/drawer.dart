import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pax_television/app_screens/Library.dart';
import 'package:pax_television/app_screens/home.dart';
import 'package:pax_television/app_screens/program_guide.dart';
import 'package:pax_television/app_screens/settings.dart';
import 'package:pax_television/app_screens/watch_live.dart';
import 'package:pax_television/colors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      child: Drawer(
        backgroundColor: primaryBlue2,
        elevation: 0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jane Copper',
                    style: TextStyle(
                      fontFamily: 'Helvetica',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: colorWhite,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Wrap(
                    children: [
                      Text(
                        'Premium ',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: primaryGolden,
                        ),
                      ),
                      Text(
                        'Member',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: colorWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 48.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              child: ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: colorWhite,
                  size: 20,
                ),
                minLeadingWidth: 40,
                leading: Icon(Icons.home, size: 30, color: colorWhite),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: colorWhite,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(thickness: 0.5, color: colorWhite),
            ),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const WatchLive(),
                //   ),
                // );
              },
              child: ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: colorWhite,
                  size: 20,
                ),
                minLeadingWidth: 40,
                leading: Image.asset(
                  'assets/icons/live.png',
                  color: colorWhite,
                  scale: 3,
                ),
                title: Text(
                  'Live',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: colorWhite,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(thickness: 0.5, color: colorWhite),
            ),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Library(),
                  ),
                );
              },
              child: ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: colorWhite,
                  size: 20,
                ),
                minLeadingWidth: 40,
                leading: Image.asset(
                  'assets/icons/Library.png',
                  color: colorWhite,
                  scale: 3,
                ),
                title: Text(
                  'Library',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: colorWhite,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(thickness: 0.5, color: colorWhite),
            ),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProgramGuide(),
                  ),
                );
              },
              child: ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: colorWhite,
                  size: 20,
                ),
                minLeadingWidth: 40,
                leading: Image.asset(
                  'assets/icons/Pguide.png',
                  color: colorWhite,
                  scale: 3,
                ),
                title: Text(
                  'Program Guide',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: colorWhite,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(thickness: 0.5, color: colorWhite),
            ),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              },
              child: ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: colorWhite,
                  size: 20,
                ),
                minLeadingWidth: 40,
                leading: Image.asset(
                  'assets/icons/Settings.png',
                  color: colorWhite,
                  scale: 3,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: colorWhite,
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
