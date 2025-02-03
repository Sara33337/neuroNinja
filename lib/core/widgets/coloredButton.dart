import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appStyle.dart';

class ColoredButton extends StatelessWidget {
  const ColoredButton({
    super.key,
    required this.buttonText,
    required this.onTap
  });

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 18, right: 18, top: 30),
        height: 40.h,
        width: 361.w,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: AppStyle().buttonColor),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  color: Colors.black.withOpacity(0.25))
            ]),
        child: TextButton(
            onPressed: () {
              onTap();  
            },
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            )));
  }
}
