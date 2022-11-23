import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pax_television/app_screens/auth.dart';
import 'package:pax_television/app_screens/login.dart';
import 'package:pax_television/models/constants.dart';
import 'package:pax_television/models/states.dart';
import 'package:pax_television/models/user_model.dart';
import 'package:pax_television/widgets/buttons.dart';
import 'package:pax_television/widgets/text_field.dart';
import '../colors.dart';
import 'package:http/http.dart' as http;

class CreateProfileFree extends StatefulWidget {
  const CreateProfileFree({super.key});

  @override
  State<CreateProfileFree> createState() => _CreateProfileFreeState();
}

class _CreateProfileFreeState extends State<CreateProfileFree> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phnumberC = TextEditingController();
  TextEditingController codeC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController repasswordC = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String country = 'Select Country';
  List<String> states = [];
  String? state = '';
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
              Container(height: 1400.h),
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
                top: 43.h,
                left: 18.w,
                child: Container(
                  width: 339.w,
                  //height: 1800.h,
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
                        SizedBox(height: 80.h),
                        Wrap(
                          children: [
                            Text(
                              'Create A ',
                              style: TextStyle(
                                fontFamily: 'Helvetica',
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: colorWhite,
                              ),
                            ),
                            Text(
                              'Profile',
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
                        SingleChildScrollView(
                          child: Form(
                            key: formkey,
                            child: Column(
                              children: [
                                TextFieldWidget(
                                  controller: nameC,
                                  hintText: 'Name',
                                  validate: true,
                                  errortext: 'Enetr Name',
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                TextFieldWidget(
                                  controller: emailC,
                                  hintText: 'Email Address',
                                  validate: true,
                                  errortext: 'Enetr Email',
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                TextFieldWidget(
                                  controller: phnumberC,
                                  hintText: 'Phone Number',
                                  validate: true,
                                  errortext: 'Enetr Phone Number',
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                InkWell(
                                  //selecting coutry
                                  onTap: () {
                                    showCountryPicker(
                                        context: context,
                                        onSelect: (Country count) {
                                          setState(() {
                                            country = count.name;
                                          });
                                          getStates(country);
                                        });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(right: 10),
                                    width: 316,
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: uiLight4, width: 1))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          country,
                                          style: TextStyle(color: uiLight4, fontWeight: FontWeight.w400),
                                        ),
                                        const Icon(Icons.keyboard_arrow_down, size: 30, color: uiLight4)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 35.h,
                                ),
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
                                          icon:
                                              Icon(Icons.keyboard_arrow_down, size: 30, color: uiLight4),
                                          isDense: true,
                                          value: state,
                                          hint: Text(
                                            'State or Province',
                                            style:
                                                TextStyle(color: uiLight4, fontWeight: FontWeight.w400),
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                          items: states.map((String items) {
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
                                              state = value.toString();
                                            });
                                          }),
                                    )),
                                SizedBox(
                                  height: 35.h,
                                ),
                                TextFieldWidget(
                                  controller: codeC,
                                  hintText: 'Zip Code or Postal Code',
                                  validate: true,
                                  errortext: 'Enetr Code',
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                TextFieldWidget(
                                  controller: passwordC,
                                  hintText: 'Create a Password*',
                                  obscureText: true,
                                  validate: true,
                                  errortext: 'Enetr Password',
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                TextFieldWidget(
                                  controller: repasswordC,
                                  hintText: 'Confirm Your Password*',
                                  obscureText: true,
                                  validate: true,
                                  errortext: 'ReEnetr Password',
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 35.h),
                        Padding(
                          padding: EdgeInsets.only(right: 42.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '*Password Requirements',
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: primaryGolden,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                '\u2022  Atlest 07 characters in length\n\u2022  Nice to include at least one of the following:\n\n   \u2022  Special Character (*@#\$)\n   \u2022  Number\n   \u2022  Capital Letter',
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: colorWhite,
                                ),
                              ),
                            ],
                          ),
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
                                ontap: () async {
                                  if (formkey.currentState!.validate()) {
                                    if (passwordC.text == repasswordC.text) {
                                      signIn();
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Alert'),
                                              content: Text('passwords did not match'),
                                              actions: [CloseButton()],
                                            );
                                          });
                                    }
                                  }
                                }),
                        SizedBox(
                          height: 35.h,
                        ),
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

  Future createUserDatabase() async {
    final newUser = await FirebaseFirestore.instance
        .collection('members')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    UserModel userdata = UserModel(
        userid: newUser.id,
        username: nameC.text,
        email: emailC.text,
        phonenumber: phnumberC.text,
        country: country,
        state: state,
        zipcode: codeC.text,
        status: true,
        subsccribed: false,
        subscrpdate: Timestamp.fromDate(DateTime.now()),
        subscrpexpiredate: Timestamp.fromDate(DateTime.now()),
        amount: 0,
        imageurl: '',
        date: Timestamp.fromDate(DateTime.now()));

    await newUser.set(userdata.toMap());
  }

  Future signIn() async {
    try {
      setState(() {
        isLoading = true;
      });
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: emailC.text,
        password: passwordC.text,
      );
      User? user = credential.user;
      if (user != null) {
        createUserDatabase();
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Auth(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Alert'),
                content: Text('Email already in use'),
                actions: [
                  CloseButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Auth(),
                        ),
                      );
                    },
                  )
                ],
              );
            });
      } else if (e.code == 'Weak-Password') {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Alert'),
                content: Text('weak Password'),
                actions: [CloseButton()],
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Alert'),
                content: Text(e.code.toString()),
                actions: [CloseButton()],
              );
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text(e.toString()),
              actions: [CloseButton()],
            );
          });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  //getting states of selected country
  Future getStates(String countryName) async {
    final token_response = await http.get(
        Uri.parse('https://www.universal-tutorial.com/api/getaccesstoken'),
        headers: {"Accept": "application/json", "api-token": stateApiToken, "user-email": email});

    if (token_response.statusCode == 200) {
      String token = jsonDecode(token_response.body)['auth_token'];
      final response = await http.get(
          Uri.parse('https://www.universal-tutorial.com/api/states/$countryName'),
          headers: {"Authorization": "Bearer $token", "Accept": "application/json"});

      if (response.statusCode == 200) {
        List<dynamic> temp = jsonDecode(response.body);
        List<StateNames> stateNames = temp.map((e) => StateNames.fromjson(e)).toList();
        if (stateNames.isNotEmpty) {
          setState(() {
            states = stateNames.map((e) => e.state_name!).toList();
            state = states[0];
          });
        }
      }
    }
  }
}
