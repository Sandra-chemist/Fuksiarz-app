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
    return Container(
      color: ColorStyle.backgroundColor,
      child: Stack(
        children: [
          Container(
            height: 100.h,
            color: ColorStyle.redColor,
          ),
          Positioned(
            top: 60.h,
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
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
