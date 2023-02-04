import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rangawardhan/Drawer/Contact.dart';
import 'package:rangawardhan/Drawer/Events.dart';
import 'Admin/adminHome.dart';
import 'Admin/login.dart';
import 'Drawer/About.dart';
import 'Drawer/Team.dart';
import 'Home/home_page.dart';
import 'natyawardhan/n_main.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.playfairDisplayTextTheme(
          Theme.of(context).textTheme,
        ),
        // textTheme: DevanagariFonts.hindTextTheme(
        //   Theme.of(context).textTheme,
        // ),
      ),
      home: AnimatedSplashScreen(
          backgroundColor: Colors.black45,
          splashIconSize: 200,
          splash: Image.asset("assets/Images/Rangwardhan_Logo.png"),
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: Home()),
      routes: {
        '/About': (context) => About(),
        '/Events': (context) => Events(),
        '/Contact_us': (context) => Contact(),
        '/Teams': (context) => Teams(),
        '/Admin_login': (context) => LoginPage(),
        '/Nmain': (context) => NMain(),
      },
    );
  }
}