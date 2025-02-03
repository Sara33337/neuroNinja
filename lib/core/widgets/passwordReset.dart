import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class passwordReset extends StatelessWidget {
  const passwordReset({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.h,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: TextField(
          textAlign: TextAlign.center, 
          decoration:const InputDecoration(
            border: InputBorder.none, 
          ),
          style: TextStyle(
            fontSize: 16.sp, // Adjust font size as needed
            color: Colors.black, // Text color
          ),
        ),
      ),
    );
  }
}