import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';

class UpperBeam extends StatelessWidget {
  final String logo;
  final String icon;
  final String text;

  const UpperBeam({
    super.key,
    required this.logo,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: verticalM4, bottom: verticalM3, right: horizontalM4, left: horizontalM3),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: ColorStyle.borderColor,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_logo, _priceButton],
      ),
    );
  }

  Widget get _logo => Image.asset(
        logo,
        width: 81.61.w,
        fit: BoxFit.contain,
      );

  Widget get _priceButton => GestureDetector(
        onTap: () {},
        child: Container(
          width: 88.5.w,
          height: 35.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: ColorStyle.borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                icon,
                width: 20.w,
                height: 20.w,
                fit: BoxFit.contain,
              ),
              Text(text, style: TextStyles.body_4),
            ],
          ),
        ),
      );
}
