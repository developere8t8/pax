import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pax_television/app_screens/home.dart';
import 'package:pax_television/app_screens/onboarding.dart';
import 'package:pax_television/colors.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pax_television/widgets/bottom_bar.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: gradientBlue,
        ),
        child: Center(
          child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballPulseRise,
                        colors: [Colors.red, Colors.yellow, Colors.green, Colors.pink, Colors.orange],
                      ),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return BottomBar(
                    page: 0,
                  );
                } else if (snapshot.hasError) {
                  return OnBoarding();
                } else {
                  return OnBoarding();
                }
              })),
        ),
      ),
    );
  }
}
