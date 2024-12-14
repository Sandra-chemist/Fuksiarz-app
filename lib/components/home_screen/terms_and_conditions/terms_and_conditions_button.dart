import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';
import 'package:fuksiarz/const/texts.dart';

class TermsAndConditionsButton extends StatelessWidget {
  final Function() onPressed;

  const TermsAndConditionsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorStyle.tertiaryGrey,
        padding: EdgeInsets.symmetric(horizontal: horizontalM2, vertical: verticalM1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
      ),
      child: Text(buttonLabel, style: TextStyles.body_3),
    );
  }
}
