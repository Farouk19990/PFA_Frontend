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
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            appBarTheme: AppBarTheme(elevation: 0, color: Colors.white)),
        home: AnimatedSplashScreen(
          splash: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  "asset/MallOfTunisia.png",
                  /* width: 250,
                  height: 150, */
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CircularProgressIndicator(
                color: Colors.deepOrange,
              )
            ],
          ),
          nextScreen: AboutUs1(),
          splashIconSize: 250,
          backgroundColor: Colors.grey.shade50,
        ));
  }
}
