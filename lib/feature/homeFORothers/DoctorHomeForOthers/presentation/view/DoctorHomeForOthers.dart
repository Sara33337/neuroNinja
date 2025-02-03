import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/EditOrSendButton.dart';
import 'package:neuro_ninja/core/widgets/FeedBackBox.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/feature/Home/presentaion/view_model/userModel.dart';


class DoctorHomeForOthers extends StatelessWidget {
  DoctorHomeForOthers({super.key, required this.userModel , required this.onTapForSend});
  final UserModel userModel;
  final VoidCallback onTapForSend;

  final List<UserModel> supervisedChildren = [
    UserModel(
      userName: "Hamza Abdo",
      userLocation: "Damietta",
      userSchool: "El-Iman Islamic School",
      userPhoneNumber: "01018548920",
      userImage: "assets/images/personalImage.jpg",
    ),
    UserModel(
      userName: "Yassin Ibrahim",
      userLocation: "Damietta",
      userSchool: "El-Iman Islamic School",
      userPhoneNumber: "01018548920",
      userImage: "assets/images/personalImage.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: Column(
        children: [
          appBar(
            showChatIcon: true,
            showBackArrow: true,
            showNotificationIcon: true,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    // Profile Image Container
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
    // User Name and Send Button
     Column(
        
        children: [
           Text(
              userModel.userName,
              style: TextStyle(
                fontSize: 21.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: "Roboto",
              ),
            ),
          
          SizedBox(height: 10.h),
          EditOrSendButton(
            onTapForSend: () {},
            textButton: "Send message",
          ),
        ],
      ),
  
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
                ),

                SizedBox(height: 45.h),
                // Supervised Children Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Doctor's reviwes",
                            style: TextStyle(
                              fontSize: 23.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto",
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      feedBackBox()
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ))
        ],
      )),
    );
  }
}
