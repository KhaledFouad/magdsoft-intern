import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String image;
  const ProductCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 42.5.w,
          height: 35.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: AppColor.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 21.h,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 0.7.h,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      color: AppColor.secBlack,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  price,
                  style: TextStyle(
                      color: AppColor.secBlack,
                      fontSize: 7.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 42.5.w,
          height: 20.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: AppColor.white,
          ),
          child: Image.asset(image),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              // Navigator.of(context).pushNamed(AppRoutes.homePageRoute);
            },
            child: Container(
                width: 10.w,
                height: 5.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xD90062BD),
                        Color(0x000062BD),
                      ],
                      stops: [
                        0,
                        1
                      ]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: AppColor.blue,
                ),
                child: Icon(
                  Icons.add,
                  color: AppColor.white,
                  size: 18.sp,
                )),
          ),
        ),
      ],
    );
  }
}
