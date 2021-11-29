import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petz_care/ui/login_page.dart';
import 'package:petz_care/ui/main_screen.dart';
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
        RegisterPage.id: (context) => RegisterPage(),
        MainScreen.id: (context) => MainScreen(),
      },
      // home: const MainScreen(),
    );
  }
}
