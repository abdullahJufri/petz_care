import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petz_care/ui/booking_screen.dart';
import 'package:petz_care/ui/detail_page.dart';
import 'package:petz_care/ui/home_page.dart';
import 'package:petz_care/ui/login_page.dart';

import 'package:petz_care/ui/main_screen.dart';
import 'package:petz_care/ui/profile_page.dart';
import 'package:petz_care/ui/register_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      initialRoute: LoginPage.id,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        LoginPage.id: (context) => LoginPage(),
        RegistrationPage.id: (context) => RegistrationPage(),
        HomePage.id: (context) => HomePage(),
        // DetailPage: (context) => DetailPage(),


        MyProfile.id: (context) => MyProfile(),
        BookingScreen.id: (context) => BookingScreen()
      },
      // home: const MainScreen(),
    );
  }
}
