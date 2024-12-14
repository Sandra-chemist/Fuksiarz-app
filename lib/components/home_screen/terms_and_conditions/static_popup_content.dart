import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';
import 'package:fuksiarz/const/texts.dart';

class StaticPopupContent extends StatelessWidget {
  final String content;

  const StaticPopupContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.close, color: ColorStyle.whiteColor.withOpacity(0.8)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              buttonLabel,
              style: TextStyles.body_1.copyWith(
                color: ColorStyle.whiteColor.withOpacity(0.8),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: verticalM3),
          MarkdownBody(
            data: content,
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              p: TextStyles.body_3.copyWith(
                color: ColorStyle.whiteColor.withOpacity(0.8),
                fontWeight: FontWeight.w400,
              ),
              h1: TextStyles.body_2.copyWith(
                color: ColorStyle.whiteColor.withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
