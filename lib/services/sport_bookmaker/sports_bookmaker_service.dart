typedef MatchesList = Future<List<SportBookmakerDTO>>;

abstract class ISportBookmakerService {
  MatchesList getMatches();
}

class SportBookmakerDTO {
  const SportBookmakerDTO({
    required this.categoryId,
    required this.category1Name,
    required this.category2Name,
    required this.category3Name,
    required this.eventName,
    required this.gamesCount,
    required this.eventGames,
  });

  final int categoryId;
  final String category1Name;
  final String category2Name;
  final String category3Name;
  final String eventName;
  final int gamesCount;
  final List<EventGamesDTO> eventGames;

  factory SportBookmakerDTO.fromJson(Map<String, dynamic> json) {
    return SportBookmakerDTO(
      categoryId: json['category1Id'],
      category1Name: json['category1Name'],
      category2Name: json['category2Name'],
      category3Name: json['category3Name'],
      eventName: json['eventName'],
      gamesCount: json['gamesCount'],
      eventGames: (json['eventGames'] as List<dynamic>)
          .map((game) => EventGamesDTO.fromJson(game as Map<String, dynamic>))
          .toList(),
    );
  }
}

class EventGamesDTO {
  final int gameId;
  final List<OutcomeDTO> outcomes;

  const EventGamesDTO({
    required this.gameId,
    required this.outcomes,
  });

  factory EventGamesDTO.fromJson(Map<String, dynamic> json) {
    return EventGamesDTO(
      gameId: json['gameId'],
      outcomes: (json['outcomes'] as List<dynamic>)
          .map((outcome) => OutcomeDTO.fromJson(outcome as Map<String, dynamic>))
          .toList(),
    );
  }
}

class OutcomeDTO {
  final int outcomeId;
  final String outcomeName;
  final int outcomePosition;

  const OutcomeDTO({
    required this.outcomeId,
    required this.outcomeName,
    required this.outcomePosition,
  });

  factory OutcomeDTO.fromJson(Map<String, dynamic> json) {
    return OutcomeDTO(
      outcomeId: json['outcomeId'],
      outcomeName: json['outcomeName'],
      outcomePosition: json['outcomePosition'],
    );
  }
}
