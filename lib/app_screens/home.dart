import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pax_television/app_screens/Library.dart';
import 'package:pax_television/app_screens/auth.dart';
import 'package:pax_television/app_screens/program_guide.dart';
import 'package:pax_television/colors.dart';
import 'package:pax_television/models/live.dart';
import 'package:pax_television/models/user_model.dart';
import 'package:pax_television/widgets/bottom_bar.dart';
import 'package:pax_television/widgets/buttons.dart';
import 'package:pax_television/widgets/slider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final id = FirebaseAuth.instance.currentUser!.uid;
  final _controller = PageController();
  List<Widget> sliders = [];
  bool isLoading = false;
  UserModel? usermodel;
  int pages = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                Container(height: 700.h),
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
                isLoading
                    ? Center(
                        child: SizedBox(
                          width: 60,
                          height: 50,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballPulseRise,
                            colors: [
                              Colors.red,
                              Colors.yellow,
                              Colors.green,
                              Colors.pink,
                              Colors.orange
                            ],
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 279.h,
                            width: MediaQuery.of(context).size.width,
                            child: PageView(
                                scrollDirection: Axis.horizontal,
                                controller: _controller,
                                children: sliders),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          pages != 0
                              ? SmoothPageIndicator(
                                  controller: _controller,
                                  count: pages,
                                  effect: ScrollingDotsEffect(
                                    activeDotColor: primaryGolden,
                                    dotColor: uiLight4,
                                    dotWidth: 10.0,
                                    dotHeight: 10.0.h,
                                    spacing: 14,
                                  ),
                                )
                              : Container(),
                          SizedBox(height: 54.h),
                          FixedPrimary(
                              buttonText: 'Program Guide',
                              ontap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomBar(page: 2),
                                  ),
                                );
                              }),
                        ],
                      ),
                Positioned(
                  top: 455.h,
                  left: 32.w,
                  child: Image.asset('assets/images/home3.png', width: 311.w, height: 180.h),
                ),
                Positioned(
                  top: 461.h,
                  left: 24.w,
                  child: Image.asset('assets/images/home3.png', width: 327.w, height: 190.h),
                ),
                Positioned(
                  top: 471.h,
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
                        Padding(
                          padding: const EdgeInsets.only(right: 130),
                          child: Text(
                            'Video Library',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: colorWhite,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        FixedBlur(
                            buttonText: 'Explore',
                            ontap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomBar(page: 1),
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

  ///all back end code
  ///
  //getting data for home page
  Future<List<Widget>> getData() async {
    setState(() => isLoading = true);
    QuerySnapshot userSnap =
        await FirebaseFirestore.instance.collection('members').where('userid', isEqualTo: id).get();
    if (userSnap.docs.isNotEmpty) {
      setState(() {
        usermodel = UserModel.fromMap(userSnap.docs.first.data() as Map<String, dynamic>);
      });
    }
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('live')
        .where('end', isGreaterThan: Timestamp.fromDate(DateTime.now()))
        .get();
    if (snap.docs.isNotEmpty) {
      List<LiveData> liveData =
          snap.docs.map((e) => LiveData.fromMap(e.data() as Map<String, dynamic>)).toList();
      setState(() {
        for (var i in liveData) {
          sliders.add(MySlider(
            liveData: i,
            userModel: usermodel!,
          ));
        }
        pages = sliders.isEmpty ? 0 : sliders.length;
      });
    }
    setState(() {
      isLoading = false;
    });
    return sliders;
  }
}
