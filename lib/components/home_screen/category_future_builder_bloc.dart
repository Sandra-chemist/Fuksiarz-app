import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuksiarz/components/home_screen/category_selector_future_build.dart';
import 'package:fuksiarz/components/home_screen/event_card/game_list_future_build.dart';
import 'package:fuksiarz/display_data/sports_data_bloc.dart';
import 'package:fuksiarz/components/loading_component.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/display_data/sports_data_event.dart';
import 'package:fuksiarz/display_data/sports_data_state.dart';
import 'package:fuksiarz/gen/assets.gen.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';

class CategoryFutureBuilderBloc extends StatefulWidget {
  const CategoryFutureBuilderBloc({super.key});

  @override
  State createState() => _CategoryFutureBuilderBlocState();
}

class _CategoryFutureBuilderBlocState extends State<CategoryFutureBuilderBloc> with SingleTickerProviderStateMixin {
  String selectedCategory = allMatchesLabel;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    context.read<SportsDataBloc>().add(FetchSportsData());
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsDataBloc, SportsDataState>(
      builder: (context, state) {
        if (state is SportsDataFetching) {
          return LoadingComponent(
            animationController: _animationController,
            iconPath: Assets.icon.loopIcon.path,
            enableAnimation: true,
          );
        } else if (state is SportsDataLoaded) {
          final categoryCounts = {
            allMatchesLabel: state.allGames.length,
            basketballLabel: state.basketballCategory.length,
            soccerLabel: state.soccerCategory.length,
            baseballLabel: state.baseballCategory.length,
          };
          return Column(
            children: [
              CategorySelectorFutureBuilder(
                selectedCategory: selectedCategory,
                categoryCounts: categoryCounts,
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              // GameListFutureBuilder(
              //   games: _getGamesForCategory(state, selectedCategory),
              // ),
            ],
          );
        } else if (state is SportsDataError) {
          return Center(child: Center(child: Text('Error: ${state.message}')));
        }
        return Container(); // Initial state
      },
    );
  }

  List<SportBookmaker> _getGamesForCategory(SportsDataLoaded state, String category) {
    switch (category) {
      case basketballLabel:
        return state.basketballCategory;
      case soccerLabel:
        return state.soccerCategory;
      case baseballLabel:
        return state.baseballCategory;
      default:
        return state.allGames;
    }
  }
}
