import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:magdsoft/presentation/router/App_Routes.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:magdsoft/presentation/widget/default_button.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sizer/sizer.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController code1Controller = TextEditingController();
  final TextEditingController code2Controller = TextEditingController();
  final TextEditingController code3Controller = TextEditingController();
  final TextEditingController code4Controller = TextEditingController();
  String text = '';

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
          child: ListView(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  "Verify Phone",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 25.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCodeSquare(code1Controller, 1),
                  buildCodeSquare(code2Controller, 2),
                  buildCodeSquare(code3Controller, 3),
                  buildCodeSquare(code4Controller, 4),
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                        color: AppColor.secBlue,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                height: 5.h,
              ),
              Padding(
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
                            .pushNamed(AppRoutes.verifyPageRoure);
                      },
                      text: "Login",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              SizedBox(
                height: 3.h,
              ),
              // NumericKeyboard(
              //     onKeyboardTap: _onKeyboardTap,
              //     textColor: AppColor.secBlack,
              //     rightButtonFn: () {
              //       setState(() {
              //         text = text.substring(0, text.length - 1);
              //       });
              //     },
              //     leftIcon: Icon(
              //       Icons.backspace_outlined,
              //       color: AppColor.secBlack,
              //     ),
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly)
            ],
          ),
        ),
      ),
    );
  }

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  Widget buildCodeSquare(TextEditingController controller, int digitIndex) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          maxLength: 1,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.sp),
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.length == 1 && digitIndex < 4) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
