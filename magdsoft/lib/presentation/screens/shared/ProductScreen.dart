import 'package:flutter/material.dart';
import 'package:magdsoft/business_logic/ProductCubit/products_cubit.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';
import '../../widget/default_button.dart';

class ProductScreen extends StatelessWidget {
  // final dynamic product;
  String? name;
    String? company;
  String? type;
  String? image;
  String? price;
  String? description;
  ProductScreen({
    super.key,
    //  required this.product,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.type,
    required this.company
  });

  @override
  Widget build(BuildContext context) {
    // final String company = product['company'];
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
            padding: EdgeInsets.all(1.5.h),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      width: 15.w,
                      height: 6.5.h,
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward_ios,
                              color: AppColor.grey, size: 25.sp),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      // product['name'] ??
                      name!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      // 'type: ${product['type'] ??
                      "type:$type",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 12.5.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 35.h,
                      child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network(
                            image!,
                          )),
                    ),
                    Container(
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      height: 12.5.h,
                      child: FutureBuilder<Map<String, dynamic>>(
                        future: ProductsCubit().fetchDataFromAPI(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else {
                            Map<String, dynamic> responseData = snapshot.data!;
                            List<dynamic> productList =
                                responseData['products'];

                            return ListView.builder(
                              reverse: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: productList.length,
                              itemBuilder: (context, index) {
                                String image = productList[index]['image'];

                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 3,
                                        blurRadius: 2,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  width: 30.w,
                                  child: Card(
                                      color: Colors.white,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.network(
                                        image,
                                      )),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 10.h,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 1.5.h),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 1,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              width: 14.w,
                              height: 6.5.h,
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 7.w),
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back_ios,
                                        color: AppColor.blue, size: 22.sp),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 1.5.h),
                              Text(
                                "${company!} Official Store",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColor.secBlack,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 0.75.h,
                              ),
                              Text(
                                "View Store",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 1,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              // width: 20.w,
                              // height: 9.h,
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  "assets/images/acer-logo-0 1.png",
                                  height: 9.h,
                                  width: 18.w,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.75.h),
                      child: Row(
                        children: [
                          Container(
                              width: 40.w,
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DefaultMaterialButton(
                                onPressed: () {},
                                text: "Add To Cart",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              )),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Price",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 0.75.h,
                              ),
                              Text(
                                "30,000 EGP",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColor.secBlack,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Center(
                      child: Container(
                        height: 0.1.h,
                        width: 70.w,
                        color: AppColor.grey,
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Review",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: AppColor.grey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Spesification",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: AppColor.grey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Column(
                          children: [
                            Text(
                              "Overview",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: AppColor.secBlack,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Image.asset("assets/images/Ellipse 7.png")
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. \r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: AppColor.grey,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
