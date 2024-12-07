import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/display_data/sports_data_event.dart';
import 'package:fuksiarz/display_data/sports_data_state.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';
import 'package:fuksiarz/services/service_locator.dart';
import 'package:fuksiarz/services/sport_bookmaker/sports_bookmaker_service.dart';
import 'package:fuksiarz/utils.dart';

class SportsDataBloc extends Bloc<SportsDataEvent, SportsDataState> {
  final ISportBookmakerService _sportsBookmakerService;

  SportsDataBloc()
      : _sportsBookmakerService = getIt<ISportBookmakerService>(),
        super(SportsDataInitial()) {
    on<FetchSportsData>(_onFetchSportsData);
    on<UpdateCategory>(_onUpdateCategory);
  }

  Future<void> _onFetchSportsData(FetchSportsData event, Emitter<SportsDataState> emit) async {
    emit(SportsDataFetching());

    try {
      final matchesDTO = await _sportsBookmakerService.getMatches();
      final items = matchesDTO.map(SportBookmaker.fromDTO).toList();

      final basketballCategory = items
          .where(
              (match) => Utils.fixPolishCharacters(match.category1Name) == Utils.fixPolishCharacters(basketballLabel))
          .toList();
      final soccerCategory = items
          .where((match) => Utils.fixPolishCharacters(match.category1Name) == Utils.fixPolishCharacters(soccerLabel))
          .toList();
      final baseballCategory = items
          .where((match) => Utils.fixPolishCharacters(match.category1Name) == Utils.fixPolishCharacters(baseballLabel))
          .toList();

      emit(SportsDataLoaded(
          allGames: items,
          basketballCategory: basketballCategory,
          soccerCategory: soccerCategory,
          baseballCategory: baseballCategory,
          eventGames: items.expand((item) => item.eventGames).toList(),
          selectedCategory: allMatchesLabel));
    } catch (e) {
      emit(SportsDataError('Failed to fetch data: $e'));
    }
  }

  Future<void> _onUpdateCategory(UpdateCategory event, Emitter<SportsDataState> emit) async {
    final state = this.state;

    if (state is SportsDataLoaded) {
      List<EventGames> filteredGames;

      switch (event.category) {
        case basketballLabel:
          filteredGames = state.basketballCategory.expand((item) => item.eventGames).toList();
          break;
        case soccerLabel:
          filteredGames = state.soccerCategory.expand((item) => item.eventGames).toList();
          break;
        case baseballLabel:
          filteredGames = state.baseballCategory.expand((item) => item.eventGames).toList();
          break;
        default:
          filteredGames = state.allGames.expand((item) => item.eventGames).toList();
      }

      emit(SportsDataLoaded(
        allGames: state.allGames,
        basketballCategory: state.basketballCategory,
        soccerCategory: state.soccerCategory,
        baseballCategory: state.baseballCategory,
        eventGames: filteredGames,
        selectedCategory: event.category,
      ));
    }
  }
}
