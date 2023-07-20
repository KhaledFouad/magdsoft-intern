import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class HelpCard extends StatefulWidget {
  final String? title;
  final String? subTitle;
  const HelpCard({super.key, this.title, this.subTitle});

  @override
  State<HelpCard> createState() => _HelpCardState();
}

class _HelpCardState extends State<HelpCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      child: ExpansionTile(
        iconColor: AppColor.secBlack,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          widget.title!,
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
            widget.subTitle!,
            style: TextStyle(
                color: AppColor.secBlack,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
          )),
        ],
      ),
    );
  }
}
