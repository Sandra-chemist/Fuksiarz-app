import 'package:flutter/material.dart';
import 'package:fuksiarz/components/home_screen/category_container.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';
import 'package:provider/provider.dart';

class CategoryFutureBuilder extends StatefulWidget {
  const CategoryFutureBuilder({super.key});

  @override
  _CategoryFutureBuilderState createState() => _CategoryFutureBuilderState();
}

class _CategoryFutureBuilderState extends State<CategoryFutureBuilder> {
  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    final sportsBookmakerModel = Provider.of<SportsBookmakerModel>(context, listen: false);

    final categoryCounts = {
      "Wszystko": sportsBookmakerModel.matches.length,
      "Koszykówka": sportsBookmakerModel.basketballCategory.length,
      "Piłka nożna": sportsBookmakerModel.soccerCategory.length,
      "Baseball": sportsBookmakerModel.baseballCategory.length,
    };

    return FutureBuilder(
      future: sportsBookmakerModel.fetchMatches(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: categoryCounts.entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = entry.key;
                    });
                  },
                  child: CategoryContainer(
                    name: entry.key,
                    count: entry.value,
                    isSelected: selectedCategory == entry.key,
                  ),
                );
              }).toList(),
            ),
          );
        }
        return const Center(child: Text("Unexpected state"));
      },
    );
  }
}
