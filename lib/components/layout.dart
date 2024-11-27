import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuksiarz/const/colors.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 100.0.dg,
            color: ColorStyle.redColor,
          ),
          Positioned(
            top: 60.0.dg,
            left: 0,
            right: 0,
            child: Container(
                decoration: const BoxDecoration(
                  color: ColorStyle.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: child),
          ),
        ],
      ),
    );
  }
}
