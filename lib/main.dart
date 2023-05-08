// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mall/view/about_us/about_us_1.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(appBarTheme: AppBarTheme(elevation: 0,color: Colors.white)),
        home: AnimatedSplashScreen(
          splash: Column(
            children: [
              Image.asset(
                "asset/mall.png",
                width: 100,
                height: 100,
              ),
              SizedBox(height: 50,),
              CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),
          nextScreen: AboutUs1(),
          splashIconSize: 250,
          backgroundColor: Color.fromARGB(255, 226, 200, 84),
        ));
  }
}
