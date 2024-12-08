import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/components/home_screen/event_card/event_card.dart';

class EventList extends StatelessWidget {
  final List<dynamic> eventGames;

  const EventList({super.key, required this.eventGames});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 146.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eventGames.length,
        itemBuilder: (context, index) {
          return EventCard(eventGame: eventGames[index]);
        },
      ),
    );
  }
}