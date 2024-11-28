import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/components/home_screen/event_card/category_name.dart';
import 'package:fuksiarz/components/home_screen/event_card/event_name.dart';
import 'package:fuksiarz/components/home_screen/event_card/outcome_row.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';
import 'package:fuksiarz/utils.dart';

class EventGameCard extends StatelessWidget {
  final EventGames eventGame;
  final SportsBookmakerModel sportsBookmakerModel;

  const EventGameCard({
    super.key,
    required this.eventGame,
    required this.sportsBookmakerModel,
  });

  @override
  Widget build(BuildContext context) {
    final SportBookmaker game = sportsBookmakerModel.games.firstWhere(
      (match) => match.eventGames.contains(eventGame),
    );
    final eventNameParts = Utils.fixPolishCharacters(game.eventName.toUpperCase()).split(' - ');

    final bestOutcome = eventGame.outcomes.reduce((current, next) {
      return current.outcomeOdds > next.outcomeOdds ? current : next;
    });

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
              CategoryName(game: game),
              EventName(eventNameParts: eventNameParts),
              OutcomeRow(eventGame: eventGame, bestOutcome: bestOutcome),
            ],
          ),
        ),
      ),
    );
  }
}
