import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fuksiarz/components/home_screen/terms_and_conditions/terms_popup.dart';
import 'package:fuksiarz/components/layout.dart';
import 'package:fuksiarz/components/search_screen/search_component.dart';
import 'package:fuksiarz/components/home_screen/terms_and_conditions/terms_and_conditions_button.dart';
import 'package:fuksiarz/components/upper_beam.dart';
import 'package:fuksiarz/const/margin.dart';
import 'package:fuksiarz/gen/assets.gen.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/components/home_screen/category_future_builder.dart';
import 'package:fuksiarz/utils.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: [
          UpperBeam(
            logo: Assets.icon.logo.path,
            icon: Assets.icon.plusIcon.path,
            text: price,
          ),
          const SearchComponent(),
          const CategoryFutureBuilder(),
          SizedBox(
            height: verticalM4,
          ),
          TermsAndConditionsButton(
            onPressed: () {
              _showTermsPopup(context);
            },
          )
        ],
      ),
    );
  }

  void _showTermsPopup(BuildContext context) {
    final shouldScroll = PopupHelper.shouldShowScrollView(loremIpsumText, context);
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.75),
      builder: (BuildContext context) => TermsPopup(
        content: loremIpsumText,
        shouldScroll: shouldScroll,
      ),
    );
  }
}
