import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/components/home_screen/category_container.dart';
import 'package:fuksiarz/components/home_screen/event_card/category_name.dart';
import 'package:fuksiarz/components/home_screen/event_card/event_name.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';
import 'package:fuksiarz/utils.dart';

class CategorySelectorFutureBuilder extends StatelessWidget {
  final Map<String, int> categoryCounts;
  final String selectedCategory;
  final Function(String) onCategorySelected;
  final List<dynamic> eventGames;

  const CategorySelectorFutureBuilder({
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 146.h),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: eventGames.length,
            itemBuilder: (context, index) {
              final eventGame = eventGames[index];
              final eventNameParts = Utils.fixPolishCharacters(eventGame.eventName.toUpperCase()).split(' - ');

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: ColorStyle.tertiaryGrey,
                    width: 1.w,
                  ),
                ),
                margin: EdgeInsets.only(left: horizontalM2, top: verticalM2),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalM2, vertical: verticalM2),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CategoryName(game: eventGame.category3Name),
                        EventName(eventNameParts: eventNameParts),
                        Row(
                          children: eventGame.outcomes
                              .map<Widget>((outcome) => Container(
                                    width: 76.w,
                                    height: 45.h,
                                    margin: EdgeInsets.only(left: horizontalM1),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.r),
                                      border: Border.all(
                                        color: ColorStyle.tertiaryGrey,
                                        width: 1.w,
                                      ),
                                      //color: bestOutcome ? ColorStyle.redColor : Colors.transparent,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${outcome.outcomeOdds}',
                                        style: TextStyles.body_4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
