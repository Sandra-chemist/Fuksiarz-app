import 'package:flutter/material.dart';
import 'package:fuksiarz/components/layout.dart';
import 'package:fuksiarz/components/upper_beam.dart';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/gen/assets.gen.dart';
import 'package:fuksiarz/screens/search_screen.dart';

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
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Layout(
                    child: SearchScreen(),
                  ),
                ),
              );
            },
            child: const Text(
              "Click",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
