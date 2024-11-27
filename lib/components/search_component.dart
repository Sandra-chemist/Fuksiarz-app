import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/screens/search_screen.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchScreen(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalM2, vertical: verticalM2),
        padding: EdgeInsets.symmetric(horizontal: horizontalM3, vertical: verticalM2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: ColorStyle.searchIconColor, width: 1.0),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: ColorStyle.searchIconColor,
              size: 18.sp,
            ),
            SizedBox(width: horizontalM2),
            Text(
              searchText.toUpperCase(),
              style: TextStyles.body_5.copyWith(color: ColorStyle.searchIconColor),
            ),
          ],
        ),
      ),
    );
  }
}
