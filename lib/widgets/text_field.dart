import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pax_television/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Icon? suffixIcon;
  final bool? obscureText;
  bool? validate;
  String? errortext;
  final keyboard;
  final maxlength;
  final controller;

  TextFieldWidget(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      this.obscureText,
      this.validate,
      this.errortext,
      this.controller,
      this.keyboard,
      this.maxlength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 316,
      child: TextFormField(
        obscureText: obscureText ?? false,
        style: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: uiLight4,
        ),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: uiLight4, width: 1),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: uiLight4,
          ),
        ),
        controller: controller,
        validator: (value) {
          if (value!.isEmpty || value == '') {
            return errortext;
          } else {
            return null;
          }
        },
        maxLength: maxlength,
        keyboardType: keyboard,
      ),
    );
  }
}
