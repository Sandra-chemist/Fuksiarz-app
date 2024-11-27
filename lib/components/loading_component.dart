import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/gen/assets.gen.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({
    super.key,
    required AnimationController animationController,
  }) : _animationController = animationController;

  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 100.h),
        child: Column(
          children: [
            _animatedIcon,
            _firstText,
            SizedBox(height: verticalM1),
            _secondText,
          ],
        ),
      ), // Progress bar
    );
  }

  AnimatedBuilder get _animatedIcon => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.rotate(
            angle: -_animationController.value * 2 * pi,
            child: child,
          );
        },
        child: Image.asset(
          Assets.icon.loopIcon.path,
          width: 84.w,
          height: 84.w,
          fit: BoxFit.contain,
        ),
      );

  Text get _secondText => Text(
        secondLoadingText.toUpperCase(),
        style: TextStyles.body_5.copyWith(color: ColorStyle.searchIconColor, fontWeight: FontWeight.w600),
      );

  Text get _firstText => Text(
        firstLoadingText.toUpperCase(),
        style: TextStyles.body_2.copyWith(fontWeight: FontWeight.w700),
      );
}
