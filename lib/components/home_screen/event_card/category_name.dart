import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/text_styles.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';
import 'package:fuksiarz/utils.dart';

class CategoryName extends StatelessWidget {
  final SportBookmaker game;

  const CategoryName({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Text(
        '${Utils.fixPolishCharacters(game.category3Name.toUpperCase())}.',
        style: TextStyles.body_6.copyWith(fontWeight: FontWeight.w600, color: ColorStyle.text2Color),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
