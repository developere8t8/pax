import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pax_television/app_screens/pervideo_plan.dart';
import 'package:pax_television/app_screens/watch_live.dart';
import 'package:pax_television/colors.dart';
import 'package:pax_television/models/playbackUrl.dart';
import 'package:pax_television/models/user_model.dart';

import 'package:pax_television/widgets/drawer.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:http/http.dart' as http;
import '../models/constants.dart';
import '../models/live.dart';

class ProgramGuide extends StatefulWidget {
  const ProgramGuide({super.key});

  @override
  State<ProgramGuide> createState() => _ProgramGuideState();
}

class _ProgramGuideState extends State<ProgramGuide> {
  bool isLoading = false;
  LiveData? nowPlaying;
  List<LiveData> commingUp = [];
  UserModel? usermodel;
  String playBackUrl = '';

  @override
  void initState() {
    getData();
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
              child: Padding(
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
                          SizedBox(height: 23.h),
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
                          InkWell(
                            onTap: () {
                              checkEligibility(nowPlaying!);
                            },
                            child: nowPlaying != null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 93,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: primaryGolden),
                                          image: DecorationImage(
                                              image: NetworkImage(nowPlaying!.thumbnail!),
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
                                                nowPlaying!.title!,
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
                                                    nowPlaying!.description!,
                                                    style: GoogleFonts.inter(
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.w500,
                                                      color: uiLight5,
                                                    ),
                                                  ),
                                                  Text(
                                                    nowPlaying!.length!,
                                                    style: GoogleFonts.inter(
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.w500,
                                                      color: uiLight5,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5.h),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Visibility(
                                                    visible: !usermodel!.subsccribed!,
                                                    child: Text(
                                                      nowPlaying!.length!,
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
                                  )
                                : Text('No data to show'),
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
                              itemCount: commingUp.isEmpty ? 0 : commingUp.length,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 93,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: primaryBlue2),
                                          image: DecorationImage(
                                              image: NetworkImage(commingUp[index].thumbnail!),
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
                                                commingUp[index].title!,
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
                                                    commingUp[index].description!,
                                                    style: GoogleFonts.inter(
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.w500,
                                                      color: uiLight5,
                                                    ),
                                                  ),
                                                  Text(
                                                    commingUp[index].length!,
                                                    style: GoogleFonts.inter(
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.w500,
                                                      color: uiLight5,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5.h),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Visibility(
                                                    visible: !usermodel!.subsccribed!,
                                                    child: Text(
                                                      commingUp[index].length!,
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
                                );
                              }),
                          SizedBox(height: 22.h),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getData() async {
    setState(() => isLoading = true);
    QuerySnapshot userSnap = await FirebaseFirestore.instance
        .collection('members')
        .where('userid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (userSnap.docs.isNotEmpty) {
      setState(() {
        usermodel = UserModel.fromMap(userSnap.docs.first.data() as Map<String, dynamic>);
      });
    }
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('live')
        .where('end', isGreaterThan: Timestamp.fromDate(DateTime.now()))
        .orderBy('end')
        .get();
    if (snap.docs.isNotEmpty) {
      List<LiveData> liveData =
          snap.docs.map((e) => LiveData.fromMap(e.data() as Map<String, dynamic>)).toList();
      setState(() {
        nowPlaying = liveData.first;
        commingUp = liveData.where((element) => element.videoID != nowPlaying!.videoID).toList();
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  //checking eligibility for watching vidoes
  Future checkEligibility(LiveData videoData) async {
    if (videoData.price == 0) {
      //if video is free
      getPlayBackUrl(); //play the video
    } else if (videoData.price! > 0) {
      //if video is not free
      if (usermodel!.subsccribed == true) {
        //check if user is subscribed
        getPlayBackUrl(); //play the video
      } else {
        //if user is not subscriberd
        //checking user has paid for this video or not
        QuerySnapshot snap = await FirebaseFirestore.instance
            .collection('video_payment')
            .where('user_id', isEqualTo: usermodel!.userid)
            .where('video_id', isEqualTo: videoData.videoID)
            .where('end_date', isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime.now()))
            .get();
        if (snap.docs.isNotEmpty) {
          //if user has paid and per video subscription is not expired
          getPlayBackUrl(); //play the video

        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VideoPaymentPlan(
                        amount: videoData.price!,
                        videotitle: videoData.title!,
                        videoID: videoData.videoID!,
                      )));
        }
      }
    }
  }

  //getting playback link
  Future getPlayBackUrl() async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.get(Uri.parse(
          '${dacastPlaybackUrl}/content/access?provider=universe&contentId=${nowPlaying!.playbackLink}'));

      var temp = jsonDecode(response.body);

      if (response.statusCode == 200) {
        PlayBackData playBackData = PlayBackData.fromJson(temp);
        setState(() {
          playBackUrl = playBackData.hls!;
        });

        //moving to player page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                WatchLive(playBackUrl: playBackUrl, currentVideo: nowPlaying!.videoID!),
          ),
        );
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'Error in playing video please try again later');
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Error in playing video please try again later');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
