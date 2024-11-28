import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';

class OutcomeCard extends StatelessWidget {
  final Outcome outcome;
  final bool isBestOutcome;

  const OutcomeCard({
    super.key,
    required this.outcome,
    required this.isBestOutcome,
  });

  @override
  Widget build(BuildContext context) {
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
        color: isBestOutcome ? ColorStyle.redColor : Colors.transparent,
      ),
      child: Center(
        child: Text(
          '${outcome.outcomeOdds}',
          style: TextStyles.body_4.copyWith(
            color: isBestOutcome ? ColorStyle.whiteColor : ColorStyle.textColor,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
