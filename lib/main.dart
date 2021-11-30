import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petz_care/ui/login_test.dart';
// import 'package:petz_care/ui/login_page.dart';
import 'package:petz_care/ui/main_screen.dart';
import 'package:petz_care/ui/profile_page.dart';
import 'package:petz_care/ui/regist_test.dart';
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
        LoginPage.id: (context) => LoginPage(),
        RegistrationPage.id: (context) => RegisterPage(),
        RegisterPage.id: (context) => RegisterPage(),
        MainScreen.id: (context) => MainScreen(),
        MyProfile.id: (context) => MyProfile()

      },
      // home: const MainScreen(),
    );
  }
}
