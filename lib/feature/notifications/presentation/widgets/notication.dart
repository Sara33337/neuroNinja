import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class notification extends StatelessWidget {
  const notification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30 , right: 30 , top: 30 , bottom: 10),
      child: Column(
        children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Image
        Container(
          width: 46.w,
          height: 46.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFA11BD5),
              width: 1.5,
            ),
            image: const DecorationImage(
              image: AssetImage("assets/images/personalImage.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: 14.w),
    
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ashraf Mohammed",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Roboto",
                ),
              ),
               SizedBox(height: 5.h), // Spacing between name and description
              Text(
                "• Nour Karam has added new observations on the child's interaction in class activities.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                ),
              ),
            ],
          ),
        ),
      ],
    ),
     Padding(
     padding: const EdgeInsets.only(left: 35 , right: 35 , top: 20 ),
     child: Divider(thickness: 1, color: Color(0xFFAAA1A1).withOpacity(0.50),),
         )
        ],
      ),
    );
  }
}