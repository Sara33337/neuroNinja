import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPhoto extends StatelessWidget {
  const EditPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 140.w,
            height: 140.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFA11BD5),
                width: 2.4,
              ),
              image: const DecorationImage(
                image: AssetImage("assets/images/personalImage.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 3.h,),
          
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 125.w,
              height: 28.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFA11BD5),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Edit photo",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
