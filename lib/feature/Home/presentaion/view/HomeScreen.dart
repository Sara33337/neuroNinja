import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/feature/Home/presentaion/view_model/userModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, 
  required this.userModel,
  required this.editOnTap});

  final UserModel userModel;
  final VoidCallback editOnTap;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 140.w,
                height: 140.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFA11BD5),
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: AssetImage(userModel.userImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              
              Column(
                children: [
                  Text(
                    userModel.userName,
                    style: TextStyle(
                      fontSize: 26.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto",
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: editOnTap,
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
                          "Edit profile",
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
              )
            ],
          ),
          SizedBox(height: 30.h),
          Text(
            "About",
            style: TextStyle(
              fontSize: 23.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto",
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              SizedBox(width: 20.w),
              Text(
                userModel.userLocation!,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              const Icon(Icons.school_outlined),
              SizedBox(width: 20.w),
              Text(
                userModel.userSchool!,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              const Icon(Icons.phone_android_rounded),
              SizedBox(width: 20.w),
              Text(
                userModel.userPhoneNumber!,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
