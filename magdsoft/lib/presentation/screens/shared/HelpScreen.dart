import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/business_logic/helpcubit/help_cubit_cubit.dart';
import 'package:magdsoft/data/models/HelpModel.dart';
import 'package:magdsoft/presentation/router/App_Routes.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:magdsoft/presentation/view/help_card.dart';
import 'package:magdsoft/presentation/widget/default_button.dart';
import 'package:sizer/sizer.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<HelpModel> allHelp = [];

  @override
  void initState() {
    super.initState();
    allHelp = BlocProvider.of<HelpCubitCubit>(context).help();
  }

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
            child: Stack(children: [
              BlocBuilder<HelpCubitCubit, HelpCubitState>(
                builder: (context, state) {
                  if (state is HelpLoaded) {
                    allHelp = state.help;
                    return ListView.builder(itemBuilder: (context, index) {
                      return  HelpCard(
                        title: allHelp[0].question,
                        subTitle:
                            'You need to create an account to use the application but you can delete your account any time you want',
                      );
                    });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.blue,
                      ),
                    );
                  }
                  // return ListView(children: [
                  //   SizedBox(
                  //     height: 5.h,
                  //   ),
                  //   Center(
                  //     child: Text(
                  //       "Help",
                  //       style: TextStyle(
                  //           color: AppColor.white,
                  //           fontSize: 25.sp,
                  //           fontWeight: FontWeight.w400),
                  //     ),
                  //   ),
                  //   SizedBox(
                  //     height: 5.h,
                  //   ),
                  //   const HelpCard(
                  //     title: "Account",
                  //     subTitle:
                  //         'You need to create an account to use the application but you can delete your account any time you want',
                  //   ),
                  //   SizedBox(
                  //     height: 2.h,
                  //   ),
                  //   const HelpCard(
                  //       title: "Data",
                  //       subTitle:
                  //           "You need to create an account to use the application but you can delete your account any time you want"),
                  //   SizedBox(
                  //     height: 2.h,
                  //   ),
                  //   const HelpCard(
                  //     title: "Fees",
                  //     subTitle:
                  //         'You need to create an account to use the application but you can delete your account any time you want',
                  //   ),
                  //   SizedBox(
                  //     height: 2.h,
                  //   ),
                  //   const HelpCard(
                  //     title: "Content",
                  //     subTitle:
                  //         'You need to create an account to use the application but you can delete your account any time you want',
                  //   ),
                  //   SizedBox(
                  //     height: 2.h,
                  //   ),
                  //   const HelpCard(
                  //     title: "Service",
                  //     subTitle:
                  //         'You need to create an account to use the application but you can delete your account any time you want',
                  //   ),
                  //   SizedBox(
                  //     height: 15.h,
                  //   ),
                  // ]);
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
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
