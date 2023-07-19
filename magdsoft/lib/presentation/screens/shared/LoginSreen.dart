import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:magdsoft/presentation/widget/default_button.dart';
import 'package:magdsoft/presentation/widget/textFormFeild.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 133, 178, 220), BlendMode.modulate),
                child: Image.asset("assets/images/login.png")),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Divider(
                            color: AppColor.blue,
                            thickness: 1,
                            endIndent: 5,
                            indent: 50,
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
                            endIndent: 50,
                            indent: 5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 7.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColor.white,
                            radius: 20.sp,
                            child: Image.asset(
                                "assets/images/Google__G__Logo 1.png"),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColor.white,
                            radius: 20.sp,
                            child: Image.asset("assets/images/ios 1.png"),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColor.white,
                            radius: 20.sp,
                            child: Image.asset("assets/images/f.png"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                margin: EdgeInsets.all(16.0.sp),
                child: SizedBox(
                  height: 42.5.h,
                  child: Padding(
                    padding: EdgeInsets.all(2.0.h),
                    child: Column(
                      children: [
                        Form(
                          key: formkey,
                          child: Center(
                            child: Text(
                              'Welcome',
                              style: TextStyle(
                                color: AppColor.secBlack,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Container(
                          height: 0.5.h,
                          width: 40.w,
                          color: AppColor.blue,
                        ),
                        SizedBox(height: 2.5.h),
                        Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: EdgeInsets.all(5),
                            child: Padding(
                                padding: EdgeInsets.all(1.6.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      textDirection: TextDirection.ltr,
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your full name',
                                        hintStyle: TextStyle(fontSize: 12.sp),
                                        hintTextDirection: TextDirection.ltr,
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.5.h, horizontal: 0.5.w),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                        SizedBox(height: 1.h),
                        Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: EdgeInsets.all(5),
                            child: Padding(
                                padding: EdgeInsets.all(1.6.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      textDirection: TextDirection.ltr,
                                      controller: phoneNumberController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your Phone number',
                                        hintStyle: TextStyle(fontSize: 12.sp),
                                        hintTextDirection: TextDirection.ltr,
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.5.h, horizontal: 0.5.w),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                        SizedBox(height: 2.5.h),
                        Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF0062BD),
                                  Color(0x460062BD),
                                ],
                                stops: [0.5, 1],
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: DefaultMaterialButton(
                              onPressed: () {},
                              text: "Login",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
