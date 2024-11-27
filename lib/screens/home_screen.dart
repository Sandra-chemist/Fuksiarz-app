import 'package:flutter/material.dart';
import 'package:fuksiarz/components/layout.dart';
import 'package:fuksiarz/components/search_screen/search_component.dart';
import 'package:fuksiarz/components/upper_beam.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/gen/assets.gen.dart';

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
        ],
      ),
    );
  }
}
