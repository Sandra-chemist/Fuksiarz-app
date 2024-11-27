import 'package:flutter/material.dart';
import 'package:fuksiarz/components/layout.dart';
import 'package:fuksiarz/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: TextButton(
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
        child: const Text("Click"),
      ),
    );
  }
}
