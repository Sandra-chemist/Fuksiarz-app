import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuksiarz/components/home_screen/category_selector_future_build.dart';
import 'package:fuksiarz/display_data/sports_data_bloc.dart';
import 'package:fuksiarz/components/loading_component.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/display_data/sports_data_event.dart';
import 'package:fuksiarz/display_data/sports_data_state.dart';
import 'package:fuksiarz/gen/assets.gen.dart';

class CategoryFutureBuilder extends StatefulWidget {
  const CategoryFutureBuilder({super.key});

  @override
  State createState() => _CategoryFutureBuilderState();
}

class _CategoryFutureBuilderState extends State<CategoryFutureBuilder> with SingleTickerProviderStateMixin {
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
        }

        if (state is SportsDataLoaded) {
          return CategorySelectorFutureBuilder(
            selectedCategory: state.selectedCategory,
            categoryCounts: {
              allMatchesLabel: state.allGames.length,
              basketballLabel: state.basketballCategory.length,
              soccerLabel: state.soccerCategory.length,
              baseballLabel: state.baseballCategory.length,
            },
            eventGames: state.eventGames,
            onCategorySelected: (category) {
              if (category != state.selectedCategory) {
                context.read<SportsDataBloc>().add(UpdateCategory(category));
              }
            },
          );
        }

        if (state is SportsDataError) {
          return Center(child: Text('Error: ${state.message}'));
        }

        return Container();
      },
    );
  }
}
