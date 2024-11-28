import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';

class LoadingComponent extends StatelessWidget {
  final AnimationController? animationController;
  final String iconPath;
  final String? firstText;
  final String? secondText;
  final bool enableAnimation;

  const LoadingComponent({
    super.key,
    this.animationController,
    required this.iconPath,
    this.firstText,
    this.secondText,
    this.enableAnimation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 100.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(),
            if (firstText != null) ...[
              SizedBox(height: verticalM4),
              if (firstText != null)
                _buildText(
                  firstText!,
                  TextStyles.body_2.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              if (secondText != null) SizedBox(height: verticalM1),
              if (secondText != null)
                _buildText(
                  secondText!,
                  TextStyles.body_5.copyWith(
                    color: ColorStyle.primaryGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    switch (enableAnimation) {
      case true:
        if (animationController != null) {
          return AnimatedBuilder(
            animation: animationController!,
            builder: (context, child) {
              return Transform.rotate(
                angle: -animationController!.value * 2 * pi,
                child: child,
              );
            },
            child: _iconWidget,
          );
        }
        return _iconWidget;

      case false:
      default:
        return _iconWidget;
    }
  }

  Widget get _iconWidget => Image.asset(
        iconPath,
        width: 84.w,
        height: 84.w,
        fit: BoxFit.contain,
      );

  Widget _buildText(String text, TextStyle style) {
    return Text(
      text.toUpperCase(),
      style: style,
      textAlign: TextAlign.center,
    );
  }
}
