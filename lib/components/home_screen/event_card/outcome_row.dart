import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';

class OutcomeRow extends StatelessWidget {
  final List<dynamic> outcomes;

  const OutcomeRow({super.key, required this.outcomes});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: outcomes.map((outcome) {
        return Container(
          width: 76.w,
          height: 45.h,
          margin: EdgeInsets.only(left: horizontalM1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            border: Border.all(
              color: ColorStyle.tertiaryGrey,
              width: 1.w,
            ),
          ),
          child: Center(
            child: Text(
              '${outcome.outcomeOdds}',
              style: TextStyles.body_4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
    );
  }
}
