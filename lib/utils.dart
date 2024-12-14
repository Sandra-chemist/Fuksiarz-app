import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
  static String fixPolishCharacters(String input) {
    Map<String, String> polishChars = {
      'Ã³': 'ó',
      'Å': 'ł',
      'Å': 'Ń',
      'Åš': 'Ś',
      'Å¼': 'ż',
      'Ã': 'Ż',
      'Å': 'Ś',
      'Å›': 'ś',
      'Å¼': 'ż',
      'Å‚': 'ł',
      'Å¡': 'ś',
      'Å½': 'Ż',
      'Ä': 'Ę'
    };

    polishChars.forEach((key, value) {
      input = input.replaceAll(key, value);
    });

    return input;
  }
}

class PopupHelper {
  static bool shouldShowScrollView(String text, BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(text: text),
      maxLines: null,
      textDirection: TextDirection.ltr,
    );

    final maxHeight = MediaQuery.of(context).size.height;
    textPainter.layout(maxWidth: MediaQuery.of(context).size.width - 32.w);
    final textHeight = textPainter.size.height;

    return textHeight > maxHeight * 0.6;
  }
}
