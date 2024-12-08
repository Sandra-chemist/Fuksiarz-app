import 'package:flutter/material.dart';
import 'package:fuksiarz/components/home_screen/category/category_list.dart';
import 'package:fuksiarz/components/home_screen/event_card/event_list.dart';

class CategorySelector extends StatelessWidget {
  final Map<String, int> categoryCounts;
  final String selectedCategory;
  final Function(String) onCategorySelected;
  final List<dynamic> eventGames;

  const CategorySelector({
    super.key,
    required this.categoryCounts,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.eventGames,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryList(
          categoryCounts: categoryCounts,
          selectedCategory: selectedCategory,
          onCategorySelected: onCategorySelected,
        ),
        EventList(eventGames: eventGames),
      ],
    );
  }
}
