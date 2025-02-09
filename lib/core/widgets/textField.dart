import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.suffixIcon,
    required this.width,
    this.controller,
    this.obscureText = false,
    this.validator,
  });

  final String labelText;
  final String? hintText;
  final IconButton? suffixIcon;
  final double width;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator; // Validator function

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.h,
      width: width.w,
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: TextFormField( // Use TextFormField instead of TextField
        controller: controller,
        obscureText: obscureText,
        validator: validator, // Now this works!
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 21, vertical: 19),
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
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.63),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.63),
              width: 1,
            ),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
