import 'package:flutter/material.dart';
import 'package:object_detector/constants/themes.dart';
import 'package:object_detector/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Object Detector",
      theme: lightTheme,
      home: SplashScreen(),
      //home: Camera(),
    );
  }
}
