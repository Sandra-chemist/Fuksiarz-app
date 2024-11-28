import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';

class SearchResultItem extends StatelessWidget {
  final String result;

  const SearchResultItem({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalM1),
      child: Container(
        decoration: BoxDecoration(
          color: ColorStyle.backgroundColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: ColorStyle.tertiaryGrey,
            width: 1.0,
          ),
        ),
        child: ListTile(
          title: Text(
            result,
            style: TextStyles.body_5.copyWith(
              color: ColorStyle.text2Color,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
