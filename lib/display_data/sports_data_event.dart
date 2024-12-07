import 'package:equatable/equatable.dart';

abstract class SportsDataEvent extends Equatable {}

class FetchSportsData extends SportsDataEvent {
  @override
  List<Object?> get props => [];
}
