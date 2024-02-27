// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:heritagekunja_app/screens/Change%20Password%20Screens/reset_password1_screen.dart';
import 'package:heritagekunja_app/screens/Change%20Password%20Screens/reset_password_failed_screen.dart';
import 'package:heritagekunja_app/screens/Change%20Password%20Screens/reset_password_success_screen.dart';
import 'package:heritagekunja_app/screens/Events%20Screen/edit_events_screen.dart';
import 'package:heritagekunja_app/screens/about_screen.dart';
import 'package:heritagekunja_app/screens/add_details_screen.dart';
import 'package:heritagekunja_app/screens/home_screen.dart';
import 'package:heritagekunja_app/screens/login_screen.dart';
import 'package:heritagekunja_app/screens/signup_screen.dart';
import 'package:heritagekunja_app/utils/colors.dart';

void main() {
  /* WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeritageKunja',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),

              //To be edited
              button: TextStyle(color: Colors.white),
            ),
      ),
      home: LoginScreen(),
    );
  }
}
