import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';
import 'package:fuksiarz/screens/home_screen.dart';
import 'package:fuksiarz/screens/search_screen.dart';
import 'package:fuksiarz/services/service_locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 830),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ChangeNotifierProvider(
          create: (_) => SportsBookmakerModel(),
          child: const MaterialApp(
            title: 'Fuksiarz',
            home: FuksiarzApp(),
          ),
        );
      },
    );
  }
}

class FuksiarzApp extends StatefulWidget {
  const FuksiarzApp({super.key});

  @override
  State<FuksiarzApp> createState() => _FuksiarzAppState();
}

class _FuksiarzAppState extends State<FuksiarzApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [HomeScreen(), SearchScreen()];
  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return _screens[_currentIndex];
  }
}
