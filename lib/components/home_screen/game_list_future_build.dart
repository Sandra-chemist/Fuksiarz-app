import 'package:flutter/material.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';
import 'package:fuksiarz/utils.dart';

class GameListFutureBuilder extends StatelessWidget {
  final SportsBookmakerModel sportsBookmakerModel;
  final String selectedCategory;

  const GameListFutureBuilder({
    super.key,
    required this.sportsBookmakerModel,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sportsBookmakerModel.fetchMatches(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final eventGames = sportsBookmakerModel.getEventGamesForCategory(sportsBookmakerModel, selectedCategory);

          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.6),
            child: ListView.builder(
              itemCount: eventGames.length,
              itemBuilder: (context, index) {
                final eventGame = eventGames[index];
                return ListTile(
                  title: Text(Utils.fixPolishCharacters(eventGame.gameId.toString())),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: eventGame.outcomes.map((outcome) {
                      return Text(Utils.fixPolishCharacters(outcome.outcomeName));
                    }).toList(),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
