import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';

class CategoryContainer extends StatelessWidget {
  final String name;
  final int count;
  final bool isSelected;

  const CategoryContainer({
    super.key,
    required this.name,
    required this.count,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle categoryStyle = TextStyles.body_5.copyWith(fontWeight: FontWeight.w700);
    TextStyle countStyle = TextStyles.body_5;

    Color backgroundColor = isSelected ? ColorStyle.secondaryGrey : ColorStyle.backgroundColor;

    return Container(
      margin: EdgeInsets.only(left: horizontalM2),
      padding: EdgeInsets.symmetric(horizontal: horizontalM2, vertical: verticalM2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: ColorStyle.tertiaryGrey),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: name.toUpperCase(),
              style: categoryStyle,
            ),
            TextSpan(
              text: ' $count',
              style: countStyle,
            ),
          ],
        ),
      ),
    );
  }
}
