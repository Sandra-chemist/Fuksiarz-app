import 'package:equatable/equatable.dart';

abstract class SportsDataEvent extends Equatable {}

class FetchSportsData extends SportsDataEvent {
  @override
  List<Object?> get props => [];
}

class UpdateCategory extends SportsDataEvent {
  final String category;

  UpdateCategory(this.category);

  @override
  List<Object?> get props => [category];
}
