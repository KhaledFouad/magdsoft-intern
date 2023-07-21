import 'package:flutter/material.dart';
import 'package:magdsoft/business_logic/helpcubit/help_cubit_cubit.dart';
import 'package:magdsoft/presentation/router/App_Routes.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:magdsoft/presentation/view/help_card.dart';
import 'package:magdsoft/presentation/widget/default_button.dart';
import 'package:sizer/sizer.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Help",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                FutureBuilder<Map<String, dynamic>>(
                  future: HelpCubitCubit().fetchDataFromAPI(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      Map<String, dynamic> responseData = snapshot.data!;
                      List<dynamic> helpList = responseData['help'];

                      return Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: ListView.builder(
                          itemCount: helpList.length,
                          itemBuilder: (context, index) {
                            String question = helpList[index]['question'];
                            String answer = helpList[index]['answer'];
                            return HelpCard(
                              title: question,
                              subTitle: answer,
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(4.h),
                    child: DefaultMaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.homePageRoute);
                      },
                      text: "Continue",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
