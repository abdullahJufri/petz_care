import 'package:flutter/material.dart';
import 'dart:async';

import 'package:petz_care/ui/login_page.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(
      duration,
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) {
              return LoginPage();
            },
          ),
        );
      },
    );
  }

  Widget buildContent() {
    return Column(
      children: [
        SizedBox(height: 150),
        Container(
          height: 250,
          width: 250,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                'assets/images/splash.jpg',
              ),
            ),
          ),
        ),
        Text(
          'PETZ CARE',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: buildContent(),
        ),
      ),
    );
  }
}
