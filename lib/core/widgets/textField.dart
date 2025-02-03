import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.hintText,
      this.suffixIcon,
      
      required this.width
      });
  final String labelText;
  final String? hintText;
  final IconButton? suffixIcon;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.h,
      width: width.w,
      margin: EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
      child: TextField(
      
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(left: 21, top: 19, bottom: 19, right: 30),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white.withOpacity(0.40),
          ),

          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.white.withOpacity(0.40),
          ),
          // TextField border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.63),
              width: 1,
            ),
          ),
          // Focused border when TextField is active
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.63),
              width: 1,
            ),
          ),

          suffixIcon: suffixIcon
        ),
      ),
    );
  }
}
