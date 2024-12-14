import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/components/home_screen/terms_and_conditions/popup_header.dart';
import 'package:fuksiarz/components/home_screen/terms_and_conditions/scrollable_popup_content.dart';
import 'package:fuksiarz/components/home_screen/terms_and_conditions/static_popup_content.dart';
import 'package:fuksiarz/const/colors.dart';

class TermsPopup extends StatelessWidget {
  final String content;
  final bool shouldScroll;

  const TermsPopup({
    super.key,
    required this.content,
    required this.shouldScroll,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.only(top: 40.h),
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        child: Material(
          color: ColorStyle.popupColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (shouldScroll) PopupHeader(shouldScroll: shouldScroll),
              if (shouldScroll)
                Expanded(child: ScrollablePopupContent(content: content))
              else
                StaticPopupContent(content: content),
            ],
          ),
        ),
      ),
    );
  }
}
