import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft/business_logic/loginCubit/cubit/login_cubit.dart';
import 'package:magdsoft/presentation/router/App_Routes.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:magdsoft/presentation/widget/default_button.dart';
import 'package:magdsoft/presentation/widget/keyboardKey.dart';
import 'package:sizer/sizer.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  //
  late List<List<dynamic>> keys;
  late String amount;

  renderKeyboard() {
    return keys
        .map(
          (x) => Row(
            children: x.map(
              (y) {
                return Expanded(
                  child: KeyboardKey(
                    label: y,
                    value: y,
                    onTap: (val) {
                      print(val);
                      if (val is Widget) {
                        onBackSpacePress();
                      } else {
                        onKeyTap(val);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
        )
        .toList();
  }

  renderAmount() {
    String display = 'Enter Code';
    TextStyle style = TextStyle(
      fontSize: 25.sp,
      color: Colors.blueGrey,
    );

    if (this.amount.length > 0) {
      display = amount;

      // NumberFormat f = NumberFormat('#,###');

      // display = f.format(int.parse(amount));

      style = style.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
    }

    return Expanded(
      child: Center(
        child: Text(
          display,
          style: style,
        ),
      ),
    );
  }

  onKeyTap(val) {
    setState(() {
      amount = amount + val;
    });
  }

  onBackSpacePress() {
    if (amount.length == 0) {
      return;
    }

    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
  }

  @override
  void initState() {
    super.initState();
    //
    keys = [
      ['3', '2', '1'],
      ['6', '5', '4'],
      ['9', '8', '7'],
      [Icon(Icons.backspace_outlined, size: 25.sp), '0', " "],
    ];

    amount = '';
  }

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

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
        child: ListView(children: [
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: Text(
              "Verify Phone",
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          renderAmount(),
          SizedBox(
            height: 5.h,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Resend Code",
              style: TextStyle(
                  color: AppColor.secBlue,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
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
                    if (amount == loginCubit.loginModel.code) {
                      Navigator.of(context).pushNamed(AppRoutes.helpPageRoute);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Wrong Code",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColor.blue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  text: "Verify",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                )),
          ),
          SizedBox(
            height: 3.h,
          ),
          ...renderKeyboard(),
        ]),
      )),
    );
  }
}
