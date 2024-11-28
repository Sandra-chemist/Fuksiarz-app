import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/components/home_screen/event_card/event_name_card.dart';
import 'package:fuksiarz/components/search_screen/loading_component.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/gen/assets.gen.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';

class GameListFutureBuilder extends StatefulWidget {
  final SportsBookmakerModel sportsBookmakerModel;
  final String selectedCategory;

  const GameListFutureBuilder({
    super.key,
    required this.sportsBookmakerModel,
    required this.selectedCategory,
  });

  @override
  State createState() => _GameListFutureBuilderState();
}

class _GameListFutureBuilderState extends State<GameListFutureBuilder> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.sportsBookmakerModel.fetchMatches(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final eventGames = widget.sportsBookmakerModel
              .getEventGamesForCategory(widget.sportsBookmakerModel, widget.selectedCategory);

          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 146.h),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: eventGames.length,
              itemBuilder: (context, index) {
                final eventGame = eventGames[index];
                return EventGameCard(
                  eventGame: eventGame,
                  sportsBookmakerModel: widget.sportsBookmakerModel,
                );
              },
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(vertical: verticalM6),
          child: LoadingComponent(
            animationController: _animationController,
            iconPath: Assets.icon.loopIcon.path,
            enableAnimation: true,
          ),
        );
      },
    );
  }
}
