import 'package:flutter/material.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/text_styles.dart';
import 'package:fuksiarz/const/texts.dart';

class PopupHeader extends StatelessWidget {
  final bool shouldScroll;

  const PopupHeader({super.key, required this.shouldScroll});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorStyle.popupColor,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              buttonLabel,
              style: TextStyles.body_2.copyWith(color: ColorStyle.whiteColor.withOpacity(0.8)),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: ColorStyle.whiteColor.withOpacity(0.8)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
