import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/widgets/EditOrSendButton.dart';

class feedBackBox extends StatelessWidget {
  const feedBackBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352.w,
      decoration: BoxDecoration(
        color: const Color(0xFF707070).withOpacity(0.30),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.all(10.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42.w,
                height: 42.h,
                margin: EdgeInsets.only(right: 10.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFA11BD5),
                    width: 1.0,
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/child.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tamara Emad",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xFFBF74EA),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto",
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Dr. Wahdan is amazing! He helped my child make great progress in managing ADHD symptoms.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
          
                    
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h,),
    
          EditOrSendButton(onTapForSend: (){}, 
                textButton: "Leave feedback")
        ],
      ),
    );
  }
}


