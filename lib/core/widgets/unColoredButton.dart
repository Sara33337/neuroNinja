import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class unColoredButton extends StatelessWidget {
  const unColoredButton({
    super.key,
    required this.buttonText,
    required this.onTap
  });

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 18, right: 18, top: 10),
        height: 40.h,
        width: 361.w,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF7C86D4), width: 1),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  color: const Color.fromARGB(255, 71, 69, 69)
                        .withOpacity(0.01),)
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
