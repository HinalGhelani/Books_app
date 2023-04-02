import 'dart:async';

import 'package:firebase_books_app/screens/homePage.dart';
import 'package:firebase_books_app/screens/onBoarding_Page2.dart';
import 'package:firebase_books_app/screens/onBoarding_page1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashScreen',
      routes: {
        '/': (context) => const HomePage(),
        'splashScreen': (context) => const SplashScreen(),
        'onBoarding_page1': (context) => const OnBoardingPage1(),
        'onBoarding_page2': (context) => const OnBoardingPage2(),
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, 'onBoarding_page1'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(end: 1, begin: 0),
            duration: const Duration(seconds: 2),
            builder: (context, val, widget) {
              return Transform.scale(
                scale: val,
                child: widget,
              );
            },
            child: Image.asset(
              "assets/images/book-logo.png",
              scale: 0.2,
            ),
          ),
        ),
      ),
    );
  }
}
