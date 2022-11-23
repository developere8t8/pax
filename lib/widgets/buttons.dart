import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pax_television/colors.dart';

class FixedPrimary extends StatelessWidget {
  final String buttonText;
  final Function ontap;
  const FixedPrimary({
    Key? key,
    required this.buttonText,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 301,
      height: 48,
      child: OutlinedButton(
        onPressed: () {
          ontap();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(primaryGolden),
          foregroundColor: MaterialStateProperty.all(primaryBlue),
          textStyle: MaterialStateProperty.all(
            GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}

class FixedBlur extends StatelessWidget {
  final String buttonText;
  final Function ontap;
  const FixedBlur({
    Key? key,
    required this.buttonText,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 301,
      height: 48,
      child: OutlinedButton(
        onPressed: () {
          ontap();
        },
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(
              color: colorWhite,
              width: 1,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(primaryBlue.withOpacity(0.70)),
          foregroundColor: MaterialStateProperty.all(colorWhite),
          textStyle: MaterialStateProperty.all(
            GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}

class AlertButton extends StatelessWidget {
  final String buttonText;
  final Function ontap;
  final Color color1;
  final Color color2;
  const AlertButton({
    Key? key,
    required this.buttonText,
    required this.ontap,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 91.21,
      height: 27.27,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4.32),
            blurRadius: 12.95,
            color: Color.fromRGBO(0, 0, 0, 0.15),
          )
        ],
      ),
      child: OutlinedButton(
        onPressed: () {
          ontap();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26.4444),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(color1),
          foregroundColor: MaterialStateProperty.all(color2),
          textStyle: MaterialStateProperty.all(
            GoogleFonts.poppins(
              fontSize: 8.63.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
