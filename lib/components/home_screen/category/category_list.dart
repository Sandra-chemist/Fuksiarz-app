import 'package:flutter/material.dart';
import 'package:fuksiarz/components/home_screen/category/category_container.dart';

class CategoryList extends StatelessWidget {
  final Map<String, int> categoryCounts;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryList({
    super.key,
    required this.categoryCounts,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoryCounts.entries.map((entry) {
          return GestureDetector(
            onTap: () => onCategorySelected(entry.key),
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
}
