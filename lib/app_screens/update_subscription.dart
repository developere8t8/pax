import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pax_television/app_screens/payment_plan.dart';
import 'package:pax_television/app_screens/payment_details_signup.dart';
import 'package:pax_television/colors.dart';
import 'package:pax_television/models/user_model.dart';
import 'package:intl/intl.dart';

import '../widgets/buttons.dart';

class UpdateSubscription extends StatefulWidget {
  const UpdateSubscription({super.key});

  @override
  State<UpdateSubscription> createState() => _UpdateSubscriptionState();
}

class _UpdateSubscriptionState extends State<UpdateSubscription> {
  bool isLoading = false;
  UserModel? userData;
  String buttonTxt = '';
  String warning = '';
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
            Column(
              children: [
                Container(
                  width: 402.w,
                  height: 211.h,
                  decoration: const BoxDecoration(
                    color: primaryGolden,
                    border: Border(
                      top: BorderSide(width: 12, color: primaryBlue),
                      bottom: BorderSide(width: 12, color: primaryBlue),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 31.h),
                      Text(
                        'Membership:',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: primaryBlue,
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        'Free',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: primaryBlue,
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Image.asset(
                        'assets/images/fplan.png',
                        width: 192.w,
                        height: 59.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 55.h),
                Text(
                  'Upgrade today for unlimited access\nto our entire library for one low\nmonthly payment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: colorWhite,
                  ),
                ),
                SizedBox(height: 58.h),
                Image.asset(
                  'assets/images/month.png',
                  width: 217,
                  height: 84,
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    warning,
                    style: TextStyle(
                      fontFamily: 'Helvetica',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: colorWhite,
                    ),
                  ),
                ),
                SizedBox(height: 58.h),
                isLoading
                    ? SizedBox(
                        width: 60,
                        height: 50,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballPulseRise,
                          colors: [Colors.red, Colors.yellow, Colors.green, Colors.pink, Colors.orange],
                        ),
                      )
                    : FixedPrimary(
                        buttonText: buttonTxt,
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentPlan(),
                            ),
                          );
                        }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future getData() async {
    setState(() {
      isLoading = true;
    });
    final userID = FirebaseAuth.instance.currentUser!.uid;

    QuerySnapshot snap =
        await FirebaseFirestore.instance.collection('members').where('userid', isEqualTo: userID).get();

    if (snap.docs.isNotEmpty) {
      setState(() {
        userData = UserModel.fromMap(snap.docs.first.data() as Map<String, dynamic>);
        if (userData!.subsccribed!) {
          buttonTxt = 'Renew Plan';
          warning =
              'Plan expiration date --> ${DateFormat('MMM-dd-yyyy').format(userData!.subscrpexpiredate!.toDate())}';
        } else {
          buttonTxt = 'Buy Premium';
        }
      });
    }
    setState(() {
      isLoading = false;
    });
  }
}
