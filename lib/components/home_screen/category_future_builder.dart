import 'package:flutter/material.dart';
import 'package:fuksiarz/components/home_screen/category_selector_future_build.dart';
import 'package:fuksiarz/components/home_screen/event_card/game_list_future_build.dart';
import 'package:fuksiarz/components/search_screen/loading_component.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/gen/assets.gen.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';
import 'package:provider/provider.dart';

class CategoryFutureBuilder extends StatefulWidget {
  const CategoryFutureBuilder({super.key});

  @override
  State createState() => _CategoryFutureBuilderState();
}

class _CategoryFutureBuilderState extends State<CategoryFutureBuilder> with SingleTickerProviderStateMixin {
  String selectedCategory = allMatchesLabel;
  Map<String, int> categoryCounts = {};
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _initializeData();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  Future<void> _initializeData() async {
    final sportsBookmakerModel = Provider.of<SportsBookmakerModel>(context, listen: false);

    await sportsBookmakerModel.fetchMatches();

    setState(() {
      categoryCounts = {
        allMatchesLabel: sportsBookmakerModel.matches.length,
        basketballLabel: sportsBookmakerModel.basketballCategory.length,
        soccerLabel: sportsBookmakerModel.soccerCategory.length,
        baseballLabel: sportsBookmakerModel.baseballCategory.length,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final sportsBookmakerModel = Provider.of<SportsBookmakerModel>(context, listen: false);

    if (categoryCounts.isEmpty) {
      return LoadingComponent(
        animationController: _animationController,
        iconPath: Assets.icon.loopIcon.path,
        enableAnimation: true,
      );
    }

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
        GameListFutureBuilder(
          sportsBookmakerModel: sportsBookmakerModel,
          selectedCategory: selectedCategory,
        ),
      ],
    );
  }
}
