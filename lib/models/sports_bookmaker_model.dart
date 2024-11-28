import 'package:flutter/material.dart';
import 'package:fuksiarz/services/service_locator.dart';
import 'package:fuksiarz/services/sport_bookmaker/sports_bookmaker_service.dart';
import 'package:fuksiarz/utils.dart';

class SportsBookmakerModel extends ChangeNotifier {
  late ISportBookmakerService _sportsBookmakerService;
  List<SportBookmaker> _matches = [];

  List<SportBookmaker> basketballCategory = [];
  List<SportBookmaker> soccerCategory = [];
  List<SportBookmaker> baseballCategory = [];

  SportsBookmakerModel() {
    _sportsBookmakerService = getIt<ISportBookmakerService>();
  }
  Future<void> fetchMatches() async {
    try {
      final List<SportBookmakerDTO> matchesDTO = await _sportsBookmakerService.getMatches();

      _matches = matchesDTO.map((matchesDTO) {
        return SportBookmaker.fromDTO(matchesDTO);
      }).toList();

      basketballCategory = _matches
          .where((match) => Utils.fixPolishCharacters(match.category1Name) == Utils.fixPolishCharacters('Koszykówka'))
          .toList();
      soccerCategory = _matches
          .where((match) => Utils.fixPolishCharacters(match.category1Name) == Utils.fixPolishCharacters('Piłka nożna'))
          .toList();
      baseballCategory = _matches
          .where((match) => Utils.fixPolishCharacters(match.category1Name) == Utils.fixPolishCharacters('Baseball'))
          .toList();

      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching matches: $e");
    }
  }

  Iterable<SportBookmaker> get matches {
    return _matches;
  }
}

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
      eventGames: dto.eventGames.map((gameDTO) => EventGames.fromDTO(gameDTO)).toList(),
    );
  }
}

class EventGames {
  final int gameId;
  final List<Outcome> outcomes;

  const EventGames({
    required this.gameId,
    required this.outcomes,
  });

  factory EventGames.fromDTO(EventGamesDTO dto) {
    return EventGames(
      gameId: dto.gameId,
      outcomes: dto.outcomes.map((outcomeDTO) => Outcome.fromDTO(outcomeDTO)).toList(),
    );
  }
}

class Outcome {
  final int outcomeId;
  final String outcomeName;
  final int outcomePosition;

  const Outcome({
    required this.outcomeId,
    required this.outcomeName,
    required this.outcomePosition,
  });

  factory Outcome.fromDTO(OutcomeDTO dto) {
    return Outcome(
      outcomeId: dto.outcomeId,
      outcomeName: dto.outcomeName,
      outcomePosition: dto.outcomePosition,
    );
  }
}
