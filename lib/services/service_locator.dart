import 'package:fuksiarz/services/sport_bookmaker/sport_bookmaker_http_service.dart';
import 'package:fuksiarz/services/sport_bookmaker/sports_bookmaker_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ISportBookmakerService>(() => SportBookmakerService());
}
