import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pax_television/app_screens/failed.dart';
import 'package:pax_television/app_screens/login.dart';
import 'package:pax_television/app_screens/success.dart';
import 'package:pax_television/models/video_payment.dart';
import 'package:pax_television/widgets/buttons.dart';
import 'package:pax_television/widgets/text_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../colors.dart';
import '../models/constants.dart';
import '../models/user_model.dart';

class PaymentDetailsSignUpPerVideo extends StatefulWidget {
  final String amount;
  final String videotitle;
  final String paymentMethod;
  final String id;
  final String videoID;
  const PaymentDetailsSignUpPerVideo(
      {Key? key,
      required this.id,
      required this.paymentMethod,
      required this.amount,
      required this.videotitle,
      required this.videoID})
      : super(key: key);

  @override
  State<PaymentDetailsSignUpPerVideo> createState() => _PaymentDetailsSignUpPerVideoState();
}

class _PaymentDetailsSignUpPerVideoState extends State<PaymentDetailsSignUpPerVideo> {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expMonth = TextEditingController();
  TextEditingController expYear = TextEditingController();
  TextEditingController cvv = TextEditingController();
  final key = GlobalKey<FormState>();
  UserModel? userData;
  bool isLoading = false;
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
              Container(height: 1150.h),
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
                  height: 1050.h,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: primaryGolden),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Form(
                      key: key,
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
                                'Add Payment ',
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
                              TextFieldWidget(
                                controller: cardNumber,
                                hintText: 'Card Number',
                                maxlength: 16,
                                keyboard: TextInputType.number,
                                errortext: 'enter card number',
                                validate: true,
                              ),
                              TextFieldWidget(
                                controller: expMonth,
                                hintText: 'Expiration Month',
                                maxlength: 2,
                                keyboard: TextInputType.number,
                                errortext: 'enter exp month',
                                validate: true,
                              ),
                              TextFieldWidget(
                                controller: expYear,
                                hintText: 'Expiration year',
                                maxlength: 4,
                                keyboard: TextInputType.number,
                                errortext: 'enter exp year',
                                validate: true,
                              ),
                              TextFieldWidget(
                                controller: cvv,
                                hintText: 'CVV',
                                keyboard: TextInputType.number,
                                errortext: 'enter cvv',
                                validate: true,
                              ),
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
                                    if (key.currentState!.validate()) {
                                      createPaymentMethod();
                                    }
                                  }),
                        ],
                      ),
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

  Future createPaymentMethod() async {
    try {
      setState(() {
        isLoading = true;
      });

      final response = await http.post(Uri.parse('https://api.stripe.com/v1/payment_methods'), headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $stripSecretKey',
      }, body: {
        'type': widget.paymentMethod,
        'card[number]': cardNumber.text,
        'card[exp_month]': expMonth.text,
        'card[exp_year]': expYear.text,
        'card[cvc]': cvv.text
      });
      if (response.statusCode == 200) {
        String id = jsonDecode(response.body)['id'];
        final success_response = await http
            .post(Uri.parse('https://api.stripe.com/v1/payment_intents/${widget.id}/confirm'), headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $stripSecretKey',
        }, body: {
          'payment_method': id,
        });
        if (success_response.statusCode == 200) {
          String status = jsonDecode(success_response.body)['status'];
          if (status == 'succeeded') {
            await FirebaseFirestore.instance //updating member table
                .collection('members')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update({'amount': FieldValue.increment(double.parse(widget.amount))});
            final newUnlock = FirebaseFirestore.instance.collection('video_payment').doc();
            VideoPaymentData videoData = VideoPaymentData(
                amount: double.parse(widget.amount),
                endDate: Timestamp.fromDate(DateTime.now().add(Duration(hours: 48))),
                id: newUnlock.id,
                paidDate: Timestamp.fromDate(DateTime.now()),
                seen: false,
                userid: FirebaseAuth.instance.currentUser!.uid,
                videoid: widget.videoID);

            await newUnlock.set(videoData.toMap());

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaymentSuccess(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaymentFailed(),
              ),
            );
          }
        } else {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Oops...',
              text: 'Some thing went wrong \n Please try again later');
        }
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Some thing went wrong \n Please try again later');
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
