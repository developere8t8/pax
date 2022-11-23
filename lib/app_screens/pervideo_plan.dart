import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pax_television/app_screens/login.dart';
import 'package:pax_television/app_screens/paymentDetail_pervideo.dart';
import 'package:pax_television/app_screens/payment_details_signup.dart';
import 'package:pax_television/widgets/buttons.dart';
import 'package:pax_television/widgets/text_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../colors.dart';
import '../models/constants.dart';

class VideoPaymentPlan extends StatefulWidget {
  final double amount;
  final String videotitle;
  final String videoID;

  const VideoPaymentPlan(
      {Key? key, required this.amount, required this.videotitle, required this.videoID})
      : super(key: key);

  @override
  State<VideoPaymentPlan> createState() => _VideoPaymentPlanState();
}

class _VideoPaymentPlanState extends State<VideoPaymentPlan> {
  bool isLoading = false;
  List<String> methods = ['card'];
  String? method = 'card';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientBlue,
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(height: 1200.h),
              Positioned(
                top: 300.h,
                left: 30.w,
                child: Image.asset(
                  'assets/images/obj_logo.png',
                  width: 325.w,
                  height: 272.h,
                  color: colorWhite.withOpacity(0.30),
                ),
              ),
              Positioned(
                top: 180.h,
                child: Container(
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
                        'Pay Per Video',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: primaryBlue,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Amount: \$${widget.amount}',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: primaryBlue,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Video: ${widget.videotitle}',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: primaryBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 43.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  height: 1100.h,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: primaryGolden),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      children: [
                        SizedBox(height: 61.h),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                //closing context
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: primaryGolden,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 60.w),
                            Image.asset(
                              'assets/images/pax_logo_1.png',
                              width: 159.w,
                              height: 64.h,
                            ),
                          ],
                        ),
                        SizedBox(height: 275.h),
                        Wrap(
                          children: [
                            Text(
                              'Payment Method ',
                              style: TextStyle(
                                fontFamily: 'Helvetica',
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: colorWhite,
                              ),
                            ),
                            Text(
                              'Details',
                              style: TextStyle(
                                fontFamily: 'Helvetica',
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: primaryGolden,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 38.h),
                        Wrap(
                          spacing: 24,
                          runSpacing: 44,
                          children: [
                            Container(
                                //selecting state or province
                                padding: EdgeInsets.only(right: 10),
                                width: 316,
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: uiLight4, width: 1))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      dropdownColor: Colors.white,
                                      focusColor: Colors.white,
                                      icon: Icon(Icons.keyboard_arrow_down, size: 30, color: uiLight4),
                                      isDense: true,
                                      value: method,
                                      hint: Text(
                                        'Select Payment Method',
                                        style: TextStyle(color: uiLight4, fontWeight: FontWeight.w400),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      items: methods.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(
                                            items,
                                            style: TextStyle(
                                              color: uiLight4,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          method = value.toString();
                                        });
                                      }),
                                )),
                          ],
                        ),
                        SizedBox(height: 58.h),
                        isLoading
                            ? SizedBox(
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
                              )
                            : FixedPrimary(
                                buttonText: 'Next',
                                ontap: () {
                                  createPaymentIntent();
                                }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createPaymentIntent() async {
    try {
      setState(() {
        isLoading = true;
      });

      int requestAmount = (widget.amount * 100).toInt();

      final response = await http.post(Uri.parse('https://api.stripe.com/v1/payment_intents'), headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $stripSecretKey',
      }, body: {
        'amount': requestAmount.toString(),
        'currency': 'usd',
        'payment_method_types[]': method
      });
      if (response.statusCode == 200) {
        String id = jsonDecode(response.body)['id'];

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentDetailsSignUpPerVideo(
              paymentMethod: method!,
              id: id,
              amount: widget.amount.toString(),
              videotitle: widget.videotitle,
              videoID: widget.videoID,
            ),
          ),
        );
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Server error ${response.statusCode}');
      }
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'Some thing went wrong \n Please try again later');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
