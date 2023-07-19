import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Image.asset("assets/images/login.png"),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 65.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    color: AppColor.blue,
                    thickness: 1,
                    endIndent: 5,
                  ),
                ),
                SizedBox(width: 2.5.w),
                const Text(
                  "OR",
                  style: TextStyle(color: AppColor.blue),
                ),
                SizedBox(width: 2.5.w),
                const Expanded(
                  child: Divider(
                    color: AppColor.blue,
                    thickness: 1,
                    indent: 5,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
