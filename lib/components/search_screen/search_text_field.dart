import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/text_styles.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/routes/app_router.gr.dart';

class SearchTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: searchText.toUpperCase(),
        hintStyle: TextStyles.body_5.copyWith(color: ColorStyle.primaryGrey),
        prefixIcon: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: ColorStyle.primaryGrey,
          ),
          onPressed: () {
            context.router.replace(const HomeRoute());
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorStyle.primaryGrey,
            width: 1.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorStyle.textColor,
            width: 1.0,
          ),
        ),
        isDense: true,
        filled: true,
        fillColor: ColorStyle.whiteColor,
      ),
    );
  }
}
