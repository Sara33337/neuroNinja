import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appStyle.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: double.infinity.h,
      decoration: BoxDecoration(
        gradient:LinearGradient
        (colors: AppStyle().angularBackgroundColor,
        stops: [0.0 , 0.50, 0.75 , 0.88, 0.94, 0.97 , 0.98, 0.99 , 1 , 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter)
        
      ),
      child: child,
    );
  }
}

