import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';

class EventName extends StatelessWidget {
  final List<String> eventNameParts;

  const EventName({
    super.key,
    required this.eventNameParts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (eventNameParts.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(bottom: verticalM1),
              child: Text(eventNameParts[0], style: TextStyles.body_5.copyWith(fontWeight: FontWeight.w600)),
            ),
          if (eventNameParts.length > 1)
            Padding(
              padding: EdgeInsets.only(bottom: verticalM1),
              child: Text(eventNameParts[1], style: TextStyles.body_5.copyWith(fontWeight: FontWeight.w600)),
            ),
        ],
      ),
    );
  }
}
