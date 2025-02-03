import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/Teacher/teacherVR/presentation/view/vrTeacherScreen.dart';

class SelectChild extends StatelessWidget {
  const SelectChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return VrTeacherScreen();
            }));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 56.w,
                height: 56.h,
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
                    Text(
                      "Yassin Ibrahim",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto",
                      ),
                    ),
                    
                
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 20),
          child: Divider(
            thickness: 1,
            color: Color(0xFFAAA1A1).withOpacity(0.50),
          ),
        )
      ],
    );
  }
}
