import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/business_logic/helpcubit/help_cubit_cubit.dart';
import 'package:magdsoft/data/models/HelpModel.dart';
import 'package:magdsoft/presentation/router/App_Routes.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:magdsoft/presentation/widget/default_button.dart';
import 'package:sizer/sizer.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Help();
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xD90062BD),
                  Color(0x000062BD),
                ],
                stops: [
                  0,
                  0.4234
                ]),
          ),
          child: Padding(
            padding: EdgeInsets.all(1.2.h),
            child: Stack(children: [
              ListView(children: [
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: Text(
                    "Help",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  child: ExpansionTile(
                    iconColor: AppColor.secBlack,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      "Account",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: AppColor.secBlue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    children: <Widget>[
                      ListTile(
                          title: Text(
                        textDirection: TextDirection.ltr,
                        'You need to create an account to use the application but you can delete your account any time you want',
                        style: TextStyle(
                            color: AppColor.secBlack,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  child: ExpansionTile(
                    iconColor: AppColor.secBlack,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      textAlign: TextAlign.left,
                      'Data',
                      style: TextStyle(
                          color: AppColor.secBlue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    children: <Widget>[
                      ListTile(
                          title: Text(
                        textDirection: TextDirection.ltr,
                        'You need to create an account to use the application but you can delete your account any time you want',
                        style: TextStyle(
                            color: AppColor.secBlack,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  child: ExpansionTile(
                    iconColor: AppColor.secBlack,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      textAlign: TextAlign.left,
                      'Fees',
                      style: TextStyle(
                          color: AppColor.secBlue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    children: <Widget>[
                      ListTile(
                          title: Text(
                        textDirection: TextDirection.ltr,
                        'You need to create an account to use the application but you can delete your account any time you want',
                        style: TextStyle(
                            color: AppColor.secBlack,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  child: ExpansionTile(
                    iconColor: AppColor.secBlack,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      textAlign: TextAlign.left,
                      'Content',
                      style: TextStyle(
                          color: AppColor.secBlue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    children: <Widget>[
                      ListTile(
                          title: Text(
                        textDirection: TextDirection.ltr,
                        'You need to create an account to use the application but you can delete your account any time you want',
                        style: TextStyle(
                            color: AppColor.secBlack,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  child: ExpansionTile(
                    iconColor: AppColor.secBlack,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      textAlign: TextAlign.left,
                      'Service',
                      style: TextStyle(
                          color: AppColor.secBlue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    children: <Widget>[
                      ListTile(
                          title: Text(
                        textDirection: TextDirection.ltr,
                        'You need to create an account to use the application but you can delete your account any time you want',
                        style: TextStyle(
                            color: AppColor.secBlack,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ]),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(4.h),
                  child: Container(
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
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.homePageRoute);
                        },
                        text: "Continue",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
