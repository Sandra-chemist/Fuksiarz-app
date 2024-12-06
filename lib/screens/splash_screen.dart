import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fuksiarz/const/colors.dart';
import 'package:fuksiarz/routes/app_router.gr.dart';
import 'package:rive/rive.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String logoAnimationUrl = "assets/logo_animation.riv";

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.router.replace(const HomeRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.backgroundColor,
      body: Center(
        child: RiveAnimation.asset(
          logoAnimationUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
