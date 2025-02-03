import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/feature/Home/presentaion/view_model/userModel.dart';
import 'package:neuro_ninja/feature/Home/presentaion/widgets/customListTile.dart';

class HomeChildForOthers extends StatelessWidget {
  HomeChildForOthers({super.key, required this.userModel , required this.onTapForSend});
  final UserModel userModel;
  final VoidCallback onTapForSend;
  final List<UserModel> followedBy = [
    UserModel(
      userName: "Mohamed Ashraf",
      userLocation: "Damietta",
      userSchool: "El-Iman Islamic School",
      userPhoneNumber: "01018548920",
      userImage: "assets/images/personalImage.jpg",
    ),
    UserModel(
      userName: "Ibrahim ElNagar",
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
                                  fontSize: 21.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              GestureDetector(
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
                                      "Send message",
                                      style: TextStyle(
                                        fontSize: 12.sp,
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
                            "Followed by",
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
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: followedBy
                            .length, // Replace with actual item count
                        itemBuilder: (context, index) {
                          return customListTile(
                            userModel: followedBy[index],
                            onTap: () {},
                          );
                        },
                      ),
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
