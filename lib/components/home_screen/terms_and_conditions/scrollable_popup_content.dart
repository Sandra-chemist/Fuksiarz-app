import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/text_styles.dart';

class ScrollablePopupContent extends StatelessWidget {
  final String content;

  const ScrollablePopupContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MarkdownBody(
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
      ),
    );
  }
}
