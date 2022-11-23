import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pax_television/colors.dart';
import 'package:pax_television/models/live.dart';
import 'package:pax_television/models/user_model.dart';
import 'package:pax_television/widgets/drawer.dart';
import 'package:pax_television/widgets/video_player.dart';
import 'package:quickalert/quickalert.dart';

class WatchLive extends StatefulWidget {
  final String playBackUrl;
  final String currentVideo;
  const WatchLive({Key? key, required this.playBackUrl, required this.currentVideo}) : super(key: key);

  @override
  State<WatchLive> createState() => _WatchLiveState();
}

class _WatchLiveState extends State<WatchLive> {
  bool isLoading = false;
  String currentPlaying = '';
  LiveData? nowPLaying;
  List<LiveData> comingUp = [];
  UserModel? userModel;

  @override
  void initState() {
    currentPlaying = widget.playBackUrl;
    getNextProgramms();
    super.initState();
  }

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
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: 375,
                    height: 279,
                    child: SamplePlayer(playBackUrl: currentPlaying),
                  ),
                  SizedBox(height: 17.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: isLoading
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
                              Text(
                                'Program Guide',
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: primaryGolden,
                                ),
                              ),
                              SizedBox(height: 17.h),
                              Text(
                                'Now Playing',
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: colorWhite,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 90,
                                    height: 93,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2, color: primaryGolden),
                                      image: DecorationImage(
                                          image: NetworkImage(nowPLaying!.thumbnail!),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    width: 240.w,
                                    height: 77.h,
                                    color: primaryGolden,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 22.h),
                                          Text(
                                            nowPLaying!.title!,
                                            style: TextStyle(
                                              fontFamily: 'Helvetica',
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: primaryBlue,
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                nowPLaying!.description!,
                                                style: GoogleFonts.inter(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: uiLight5,
                                                ),
                                              ),
                                              Text(
                                                nowPLaying!.length!,
                                                style: GoogleFonts.inter(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: uiLight5,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 3.h),
                                          SizedBox(height: 3.h),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Visibility(
                                                visible: !userModel!.subsccribed!,
                                                child: Text(
                                                  '\$${nowPLaying!.price!}',
                                                  style: GoogleFonts.inter(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: uiLight5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 27.h),
                              Text(
                                'Coming Up',
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: colorWhite,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              ListView.builder(
                                  itemCount: comingUp.isEmpty ? 0 : comingUp.length,
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 90,
                                          height: 93,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 2, color: primaryBlue2),
                                            image: DecorationImage(
                                                image: NetworkImage(comingUp[index].thumbnail!),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Container(
                                          width: 240.w,
                                          height: 77.h,
                                          color: primaryBlue2,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 22.h),
                                                Text(
                                                  comingUp[index].title!,
                                                  style: TextStyle(
                                                    fontFamily: 'Helvetica',
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: primaryBlue,
                                                  ),
                                                ),
                                                SizedBox(height: 5.h),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      comingUp[index].description!,
                                                      style: GoogleFonts.inter(
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.w500,
                                                        color: uiLight5,
                                                      ),
                                                    ),
                                                    Text(
                                                      comingUp[index].length!,
                                                      style: GoogleFonts.inter(
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.w500,
                                                        color: uiLight5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 3.h),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Visibility(
                                                      visible: !userModel!.subsccribed!,
                                                      child: Text(
                                                        '\$${comingUp[index].price!}',
                                                        style: GoogleFonts.inter(
                                                          fontSize: 10.sp,
                                                          fontWeight: FontWeight.w500,
                                                          color: uiLight5,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                              SizedBox(height: 22.h),
                            ],
                          ),
                  ),
                  SizedBox(height: 93.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getNextProgramms() async {
    try {
      setState(() {
        isLoading = true;
      });
      QuerySnapshot userSnap = await FirebaseFirestore.instance
          .collection('members')
          .where('userid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (userSnap.docs.isNotEmpty) {
        setState(() {
          userModel = UserModel.fromMap(userSnap.docs.first.data() as Map<String, dynamic>);
        });
      }
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('live')
          .where('end', isGreaterThan: Timestamp.fromDate(DateTime.now()))
          .orderBy('end')
          .get();
      if (snap.docs.isNotEmpty) {
        List<LiveData> data =
            snap.docs.map((e) => LiveData.fromMap(e.data() as Map<String, dynamic>)).toList();
        setState(() {
          nowPLaying = data.firstWhere((element) => element.videoID! == widget.currentVideo);
          comingUp = data.where((element) => element.videoID != widget.currentVideo).toList();
        });
      }
    } catch (e) {
      QuickAlert.show(context: context, type: QuickAlertType.error, text: 'Error in loading data');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
