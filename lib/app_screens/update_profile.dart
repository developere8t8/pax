import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pax_television/colors.dart';
import 'package:pax_television/models/states.dart';
import 'package:http/http.dart' as http;
import 'package:pax_television/models/constants.dart';
import '../models/user_model.dart';
import '../widgets/buttons.dart';
import '../widgets/text_field.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  bool isLoading = false;
  TextEditingController nameC = TextEditingController();
  TextEditingController phnumberC = TextEditingController();
  //TextEditingController country = TextEditingController();
  TextEditingController codeC = TextEditingController();
  String country = 'Select Country';
  List<String> states = [];
  String? state = '';
  UserModel? userData;
  String useremail = '';
  final formkey = GlobalKey<FormState>();

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
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        SizedBox(height: 23.h),
                        Text(
                          'Update Your Profile Information',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: primaryGolden,
                          ),
                        ),
                        SizedBox(height: 38.h),
                        Wrap(
                          spacing: 24,
                          runSpacing: 32,
                          children: [
                            TextFieldWidget(
                              controller: nameC,
                              hintText: 'Name',
                              validate: true,
                              errortext: 'Enetr Name',
                            ),
                            Container(
                              width: 316,
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: uiLight4, width: 1))),
                              child: Text(
                                useremail,
                                style: TextStyle(color: uiLight4, fontWeight: FontWeight.w400),
                              ),
                            ),

                            // TextFieldWidget(
                            //   controller: emailC,
                            //   hintText: 'Email Address',
                            //   validate: true,
                            //   errortext: 'Enetr Email',
                            // ),
                            TextFieldWidget(
                              controller: phnumberC,
                              hintText: 'Phone Number',
                              validate: true,
                              errortext: 'Enetr Phone Number',
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
                            // TextFieldWidget(
                            //   hintText: 'Country',
                            //   suffixIcon:
                            //       const Icon(Icons.keyboard_arrow_down, size: 30, color: uiLight4),
                            // ),
                            // TextFieldWidget(
                            //   hintText: 'State or Province',
                            //   suffixIcon:
                            //       const Icon(Icons.keyboard_arrow_down, size: 30, color: uiLight4),
                            // ),
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
                                      value: state,
                                      hint: Text(
                                        'State or Province',
                                        style: TextStyle(color: uiLight4, fontWeight: FontWeight.w400),
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
                            TextFieldWidget(
                              controller: codeC,
                              hintText: 'Zip Code or Postal Code',
                              validate: true,
                              errortext: 'Enetr Code',
                            ),
                          ],
                        ),
                        SizedBox(height: 98.h),
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
                                buttonText: 'Save changes',
                                ontap: () {
                                  if (formkey.currentState!.validate()) {
                                    updateData();
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
    );
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
        nameC.text = userData!.username!;
        useremail = userData!.email!;
        phnumberC.text = userData!.phonenumber!;
        country = userData!.country!;
        state = userData!.state!;
        codeC.text = userData!.zipcode!;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  Future updateData() async {
    setState(() {
      isLoading = true;
    });

    final updateProfile = FirebaseFirestore.instance.collection('members').doc(userData!.userid!);

    UserModel userdata = UserModel(
        userid: userData!.userid!,
        username: nameC.text,
        email: useremail,
        phonenumber: phnumberC.text,
        country: country,
        state: state,
        zipcode: codeC.text,
        status: userData!.status,
        subsccribed: userData!.subsccribed,
        subscrpdate: userData!.subscrpdate,
        subscrpexpiredate: userData!.subscrpexpiredate,
        amount: userData!.amount,
        imageurl: '',
        date: userData!.date);
    await updateProfile.update(userdata.toMap());
    setState(() {
      isLoading = false;
    });
  }
}
