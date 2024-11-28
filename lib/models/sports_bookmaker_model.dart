import 'package:flutter/material.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/services/service_locator.dart';
import 'package:fuksiarz/services/sport_bookmaker/sports_bookmaker_service.dart';
import 'package:fuksiarz/utils.dart';

class SportsBookmakerModel extends ChangeNotifier {
  late ISportBookmakerService _sportsBookmakerService;
  List<SportBookmaker> _items = [];

  List<SportBookmaker> basketballCategory = [];
  List<SportBookmaker> soccerCategory = [];
  List<SportBookmaker> baseballCategory = [];

  SportsBookmakerModel() {
    _sportsBookmakerService = getIt<ISportBookmakerService>();
  }

  Future<void> fetchGames() async {
    try {
      final List<SportBookmakerDTO> matchesDTO = await _sportsBookmakerService.getMatches();

      _items = matchesDTO.map((matchesDTO) {
        return SportBookmaker.fromDTO(matchesDTO);
      }).toList();

      basketballCategory = _items
          .where((match) => Utils.fixPolishCharacters(match.category1Name) == Utils.fixPolishCharacters('Koszykówka'))
          .toList();
      soccerCategory = _items
          .where((match) => Utils.fixPolishCharacters(match.category1Name) == Utils.fixPolishCharacters('Piłka nożna'))
          .toList();
      baseballCategory = _items
          .where((match) => Utils.fixPolishCharacters(match.category1Name) == Utils.fixPolishCharacters('Baseball'))
          .toList();
      notifyListeners();
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  List<EventGames> getEventGamesForCategory(SportsBookmakerModel sportsBookmakerModel, String categoryName) {
    final fixedCategoryName = Utils.fixPolishCharacters(categoryName);
    List<EventGames> eventGames = [];

    switch (fixedCategoryName) {
      case basketballLabel:
        eventGames = sportsBookmakerModel.basketballCategory.expand((item) => item.eventGames).toList();
        break;
      case soccerLabel:
        eventGames = sportsBookmakerModel.soccerCategory.expand((item) => item.eventGames).toList();
        break;
      case baseballLabel:
        eventGames = sportsBookmakerModel.baseballCategory.expand((item) => item.eventGames).toList();
        break;
      default:
        eventGames = sportsBookmakerModel.games.expand((item) => item.eventGames).toList();
        break;
    }
    return eventGames;
  }

  Iterable<SportBookmaker> get games {
    return _items;
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
