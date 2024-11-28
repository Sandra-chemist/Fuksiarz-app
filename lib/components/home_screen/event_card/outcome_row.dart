import 'package:flutter/material.dart';
import 'package:fuksiarz/components/home_screen/event_card/outcome_card.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';

class OutcomeRow extends StatelessWidget {
  final EventGames eventGame;
  final Outcome bestOutcome;

  const OutcomeRow({
    super.key,
    required this.eventGame,
    required this.bestOutcome,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: eventGame.outcomes.map((outcome) {
        bool isBestOutcome = outcome == bestOutcome;

        return OutcomeCard(
          outcome: outcome,
          isBestOutcome: isBestOutcome,
        );
      }).toList(),
    );
  }
}
