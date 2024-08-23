import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:object_detector/constants/paths.dart';
import 'package:object_detector/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000, splash: logopath, nextScreen: HomeScreen());
  }
  // const
}
