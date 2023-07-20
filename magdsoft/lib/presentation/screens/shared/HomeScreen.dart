import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/router/App_Routes.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:magdsoft/presentation/view/product_card.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            padding: EdgeInsets.all(1.1.h),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 15.w,
                        height: 6.5.h,
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.filter_alt,
                                color: AppColor.grey, size: 25.sp),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75.w,
                        height: 6.5.h,
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.search,
                                    color: AppColor.grey, size: 25.sp),
                                onPressed: () {},
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(left: 1.6.h),
                                child: const Text(
                                  'Search',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                        "assets/images/Acer-Predator-Helios-300-2021 2.png"),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    height: 6.5.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                            width: 30.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100),
                              color: AppColor.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Razer",
                                    style: TextStyle(
                                        color: AppColor.secBlack,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp),
                                  ),
                                  Material(
                                    borderRadius: BorderRadius.circular(30),
                                    elevation: 2,
                                    child: CircleAvatar(
                                      backgroundColor: AppColor.white,
                                      child: Image.asset(
                                          "assets/images/Razer-Logo 2.png"),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          width: 4.w,
                        ),
                        Container(
                            width: 30.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Acer",
                                    style: TextStyle(
                                        color: AppColor.secBlack,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp),
                                  ),
                                  Material(
                                    borderRadius: BorderRadius.circular(30),
                                    elevation: 2,
                                    child: CircleAvatar(
                                      backgroundColor: AppColor.white,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: Image.asset(
                                            "assets/images/309-3098835_predator-tlcs-2017-acer-predator-logo-vector 2.png"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          width: 4.w,
                        ),
                        Container(
                          width: 30.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColor.blue,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "All",
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(30),
                                  elevation: 2,
                                  child: CircleAvatar(
                                    backgroundColor: AppColor.white,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30.0),
                                      child: Image.asset(
                                          "assets/images/vector-trophy-cup-icon 2.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const ProductCard(
                            title: "Razer",
                            subtitle: "Razer Blade Stealth 13",
                            price: "32,000 EGP",
                            image: "assets/images/2630-1-en-v2 2.png"),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ProductCard(
                            title: "Acer",
                            subtitle: "Predator Helios 300",
                            price: "35,000 EGP",
                            image: "assets/images/71nz3cIcFOL 1.png")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 40.5.w,
                          child: Text(
                            "Recomended for You",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColor.secBlack,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const ProductCard(
                            title: "Razer",
                            subtitle: "Razer Blade Stealth 13",
                            price: "32,000 EGP",
                            image: "assets/images/2630-1-en-v2 2.png"),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ProductCard(
                            title: "Acer",
                            subtitle: "Predator Helios 300",
                            price: "30,000 EGP",
                            image: "assets/images/71nz3cIcFOL 1.png")
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
