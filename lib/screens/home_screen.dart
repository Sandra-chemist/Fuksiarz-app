import 'package:flutter/material.dart';
import 'package:fuksiarz/components/layout.dart';
import 'package:fuksiarz/components/search_screen/search_component.dart';
import 'package:fuksiarz/components/upper_beam.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/gen/assets.gen.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sportsBookmakerModel = Provider.of<SportsBookmakerModel>(context, listen: false);

    return Layout(
      child: Column(
        children: [
          UpperBeam(
            logo: Assets.icon.logo.path,
            icon: Assets.icon.plusIcon.path,
            text: price,
          ),
          const SearchComponent(),
          FutureBuilder(
              future: sportsBookmakerModel.fetchMatches(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  final basketballCount = sportsBookmakerModel.basketballCategory.length;
                  final soccerCount = sportsBookmakerModel.soccerCategory.length;
                  final baseballCount = sportsBookmakerModel.baseballCategory.length;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Koszykówka: $basketballCount meczów"),
                      Text("Piłka nożna: $soccerCount meczów"),
                      Text("Baseball: $baseballCount meczów"),
                    ],
                  );
                }
                return const Center(child: Text("Unexpected state"));
              })
        ],
      ),
    );
  }
}
