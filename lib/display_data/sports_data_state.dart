import 'package:equatable/equatable.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';

abstract class SportsDataState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SportsDataInitial extends SportsDataState {}

class SportsDataFetching extends SportsDataState {}

class SportsDataLoaded extends SportsDataState {
  final List<SportBookmaker> allGames;
  final List<SportBookmaker> basketballCategory;
  final List<SportBookmaker> soccerCategory;
  final List<SportBookmaker> baseballCategory;

  SportsDataLoaded({
    required this.allGames,
    required this.basketballCategory,
    required this.soccerCategory,
    required this.baseballCategory,
  });
}

class SportsDataError extends SportsDataState {
  final String message;
  SportsDataError(this.message);
}
