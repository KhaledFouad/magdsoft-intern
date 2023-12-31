import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/router/App_Routes.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),
        () => Navigator.of(context).pushNamed(AppRoutes.loginPageRoute));
    return Scaffold(
      // appBar: AppBar(),
      body: Image.asset(
        "assets/images/splash.png",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
