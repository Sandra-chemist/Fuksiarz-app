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
      final items = await _fetchMatches();
      final categorizedData = _categorizeMatches(items);

      emit(SportsDataLoaded(
        allGames: items,
        basketballCategory: categorizedData[basketballLabel] ?? [],
        soccerCategory: categorizedData[soccerLabel] ?? [],
        baseballCategory: categorizedData[baseballLabel] ?? [],
        eventGames: items.expand((item) => item.eventGames).toList(),
        selectedCategory: allMatchesLabel,
      ));
    } catch (e) {
      emit(SportsDataError('Failed to fetch data: $e'));
    }
  }

  Future<List<SportBookmaker>> _fetchMatches() async {
    final matchesDTO = await _sportsBookmakerService.getMatches();
    return matchesDTO.map(SportBookmaker.fromDTO).toList();
  }

  Map<String, List<SportBookmaker>> _categorizeMatches(List<SportBookmaker> matches) {
    final Map<String, List<SportBookmaker>> categorizedMatches = {};

    for (final label in [basketballLabel, soccerLabel, baseballLabel]) {
      categorizedMatches[label] = _filterCategory(matches, label);
    }

    return categorizedMatches;
  }

  List<SportBookmaker> _filterCategory(List<SportBookmaker> items, String label) {
    return items
        .where((match) => Utils.fixPolishCharacters(match.category1Name) == Utils.fixPolishCharacters(label))
        .toList();
  }

  Future<void> _onUpdateCategory(UpdateCategory event, Emitter<SportsDataState> emit) async {
    final state = this.state;

    if (state is SportsDataLoaded) {
      final categoryMap = {
        basketballLabel: state.basketballCategory,
        soccerLabel: state.soccerCategory,
        baseballLabel: state.baseballCategory,
      };

      final filteredGames = categoryMap[event.category]?.expand((item) => item.eventGames).toList() ??
          state.allGames.expand((item) => item.eventGames).toList();

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
