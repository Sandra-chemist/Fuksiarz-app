import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fuksiarz/components/layout.dart';
import 'package:fuksiarz/components/search_screen/search_component.dart';
import 'package:fuksiarz/components/upper_beam.dart';
import 'package:fuksiarz/gen/assets.gen.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/components/home_screen/category_future_builder.dart';

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
        ],
      ),
    );
  }
}
