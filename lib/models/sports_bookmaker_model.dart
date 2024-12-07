import 'package:fuksiarz/services/sport_bookmaker/sports_bookmaker_service.dart';

class SportBookmaker {
  final int categoryId;
  final String category1Name;
  final String category2Name;
  final String category3Name;
  final String eventName;
  final int gamesCount;
  final List<EventGames> eventGames;

  const SportBookmaker({
    required this.categoryId,
    required this.category1Name,
    required this.category2Name,
    required this.category3Name,
    required this.eventName,
    required this.gamesCount,
    required this.eventGames,
  });
  factory SportBookmaker.fromDTO(SportBookmakerDTO dto) {
    return SportBookmaker(
      categoryId: dto.categoryId,
      category1Name: dto.category1Name,
      category2Name: dto.category2Name,
      category3Name: dto.category3Name,
      eventName: dto.eventName,
      gamesCount: dto.gamesCount,
      eventGames:
          dto.eventGames.map((gameDTO) => EventGames.fromDTO(gameDTO, dto.category3Name, dto.eventName)).toList(),
    );
  }
}

class EventGames {
  final int gameId;
  final String category3Name;
  final String eventName;
  final List<Outcome> outcomes;

  const EventGames({
    required this.gameId,
    required this.category3Name,
    required this.eventName,
    required this.outcomes,
  });

  factory EventGames.fromDTO(EventGamesDTO dto, String category3Name, String eventName) {
    return EventGames(
      gameId: dto.gameId,
      category3Name: category3Name,
      eventName: eventName,
      outcomes: dto.outcomes.map((outcomeDTO) => Outcome.fromDTO(outcomeDTO)).toList(),
    );
  }
}

class Outcome {
  final int outcomeId;
  final String outcomeName;
  final double outcomeOdds;

  const Outcome({
    required this.outcomeId,
    required this.outcomeName,
    required this.outcomeOdds,
  });

  factory Outcome.fromDTO(OutcomeDTO dto) {
    return Outcome(
      outcomeId: dto.outcomeId,
      outcomeName: dto.outcomeName,
      outcomeOdds: dto.outcomeOdds,
    );
  }
}
