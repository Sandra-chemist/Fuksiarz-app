import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/const/text_styles.dart';
import 'package:fuksiarz/const/texts.dart';

class AdGallery extends StatelessWidget {
  final List<String> imagePaths;
  const AdGallery({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _textSection,
        _gallerySection,
      ],
    );
  }

  Padding get _textSection => Padding(
        padding: EdgeInsets.only(top: verticalM3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              recommendedText.toUpperCase(),
              style: TextStyles.body_4,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  allShowText.toUpperCase(),
                  style: TextStyles.body_4.copyWith(color: ColorStyle.redColor),
                ))
          ],
        ),
      );

  Widget get _gallerySection => SizedBox(
        height: 80.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: horizontalM2),
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      );
}
