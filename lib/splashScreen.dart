import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:test123/t.dart';

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          splash: Image.asset("Assets/qa.jpeg"),
          duration: 2000,
          splashTransition: SplashTransition.sizeTransition,
          backgroundColor: Colors.blue,
          nextScreen: t()),
    );
  }
}
