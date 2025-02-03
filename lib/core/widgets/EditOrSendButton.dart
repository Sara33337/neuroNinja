import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditOrSendButton extends StatelessWidget {
  const EditOrSendButton({
    super.key,
    required this.onTapForSend,
    required this.textButton
  });
  final String textButton;

  final VoidCallback onTapForSend;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapForSend,
      child: Container(
        width: 99.w,
        height: 28.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF7C86D4),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            textButton,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto",
            ),
          ),
        ),
      ),
    );
  }
}
