// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/router/App_Routes.dart';
import 'package:magdsoft/presentation/screens/shared/HomeScreen.dart';
import 'package:magdsoft/presentation/screens/shared/LoginSreen.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class NavigationBar extends StatelessWidget {
  final bool isUserLoggedIn;

  const NavigationBar({Key? key, required this.isUserLoggedIn})
      : super(key: key);

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.loginPageRoute, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 5.h,
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                _logout(context);
              },
              icon: const Icon(
                Icons.login,
                color: Colors.grey,
              ),
            ),
            Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            SizedBox(width: 48.0),
            Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
            Icon(
              Icons.settings,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 56.0,
        height: 56.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              AppColor.blue,
            ],
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            _logout(context);
          },
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          highlightElevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          child: const Icon(Icons.home),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
