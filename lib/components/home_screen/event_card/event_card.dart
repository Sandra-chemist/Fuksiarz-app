import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/components/home_screen/event_card/category_name.dart';
import 'package:fuksiarz/components/home_screen/event_card/event_name.dart';
import 'package:fuksiarz/components/home_screen/event_card/outcome_row.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/utils.dart';

class EventCard extends StatelessWidget {
  final dynamic eventGame;

  const EventCard({super.key, required this.eventGame});

  @override
  Widget build(BuildContext context) {
    final eventNameParts = Utils.fixPolishCharacters(eventGame.eventName.toUpperCase()).split(' - ');

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: ColorStyle.tertiaryGrey,
          width: 1.w,
        ),
      ),
      margin: EdgeInsets.only(left: horizontalM2, top: verticalM2),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalM2, vertical: verticalM2),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryName(game: eventGame.category3Name),
              EventName(eventNameParts: eventNameParts),
              OutcomeRow(outcomes: eventGame.outcomes),
            ],
          ),
        ),
      ),
    );
  }
}
