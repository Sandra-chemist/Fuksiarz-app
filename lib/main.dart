import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/models/sports_bookmaker_model.dart';
import 'package:fuksiarz/routes/app_router.dart';
import 'package:fuksiarz/services/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    RiveFile.initialize();

    return ScreenUtilInit(
      designSize: const Size(375, 830),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ChangeNotifierProvider(
          create: (_) => SportsBookmakerModel(),
          child: MaterialApp.router(
            routerConfig: appRouter.config(),
            title: 'Fuksiarz',
          ),
        );
      },
    );
  }
}
