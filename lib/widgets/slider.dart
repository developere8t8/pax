import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pax_television/app_screens/pervideo_plan.dart';
import 'package:pax_television/models/constants.dart';
import 'package:pax_television/models/live.dart';
import 'package:http/http.dart' as http;
import 'package:pax_television/models/playbackUrl.dart';
import 'package:pax_television/models/user_model.dart';
import 'package:quickalert/quickalert.dart';
import '../app_screens/watch_live.dart';
import '../colors.dart';

class MySlider extends StatefulWidget {
  final LiveData liveData;
  final UserModel userModel;
  const MySlider({super.key, required this.liveData, required this.userModel});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  final id = FirebaseAuth.instance.currentUser!.uid;
  String playBackUrl = '';
  bool isLoading = false;
  UserModel? usermodel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: SizedBox(
              width: 60,
              height: 50,
              child: LoadingIndicator(
                indicatorType: Indicator.ballPulseRise,
                colors: [Colors.red, Colors.yellow, Colors.green, Colors.pink, Colors.orange],
              ),
            ),
          )
        : Container(
            width: 375.w,
            height: 279.h,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(widget.liveData.thumbnail!), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        checkEligibility();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => WatchLive(
                        //         playBackUrl: playBackUrl, currentVideo: widget.liveData.videoID!),
                        //   ),
                        // );
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: gradientGolden,
                          border: Border.all(width: 1, color: colorWhite),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5),
                            Image.asset(
                              'assets/icons/live.png',
                              scale: 4,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Live',
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: colorBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 132.h),
                  Text(
                    widget.liveData.title!,
                    style: TextStyle(
                      fontFamily: 'Helvetica',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      color: colorWhite,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    widget.liveData.description!,
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: uiLight4,
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Future getPlayBackUrl() async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.get(Uri.parse(
          '${dacastPlaybackUrl}/content/access?provider=universe&contentId=${widget.liveData.playbackLink}'));

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
                WatchLive(playBackUrl: playBackUrl, currentVideo: widget.liveData.videoID!),
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

  Future checkEligibility() async {
    if (widget.liveData.price == 0) {
      //if video is free
      getPlayBackUrl(); //play the video
    } else if (widget.liveData.price! > 0) {
      //if video is not free
      if (widget.userModel.subsccribed == true) {
        //check if user is subscribed
        getPlayBackUrl(); //play the video
      } else {
        //if user is not subscriberd
        //checking user has paid for this video or not
        QuerySnapshot snap = await FirebaseFirestore.instance
            .collection('video_payment')
            .where('user_id', isEqualTo: widget.userModel.userid)
            .where('video_id', isEqualTo: widget.liveData.videoID)
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
                        amount: widget.liveData.price!,
                        videotitle: widget.liveData.title!,
                        videoID: widget.liveData.videoID!,
                      )));
        }
      }
    }
  }

  // Future getUser() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   QuerySnapshot userSnap =
  //       await FirebaseFirestore.instance.collection('members').where('id', isEqualTo: id).get();
  //   if (userSnap.docs.isNotEmpty) {
  //     setState(() {
  //       usermodel = UserModel.fromMap(userSnap.docs.first.data() as Map<String, dynamic>);
  //       print(usermodel!.username!);
  //     });
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
}
