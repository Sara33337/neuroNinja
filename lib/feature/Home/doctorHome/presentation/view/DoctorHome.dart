import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/feature/EditProfile/EditDoctor/presentation/view/editDoctorProfile.dart';
import 'package:neuro_ninja/feature/Home/presentaion/view_model/userModel.dart';
import 'package:neuro_ninja/feature/Home/presentaion/widgets/customListTile.dart';
import 'package:neuro_ninja/feature/Home/presentaion/view/HomeScreen.dart';
import 'package:neuro_ninja/Child/ChildhomeFORother/presentation/childHomeForOthers.dart';

class HomeDoctor extends StatefulWidget {
  HomeDoctor({super.key});

  final List<UserModel> supervisedChildren = [
    UserModel(
      userName: "Sara Abdo",
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

    UserModel(
      userName: "Hamza Ibrahim",
      userLocation: "Damietta",
      userSchool: "El-Iman Islamic School",
      userPhoneNumber: "01018548920",
      userImage: "assets/images/personalImage.jpg",
    ),
  ];

  @override
  State<HomeDoctor> createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        
          child: Column(
            children: [
              // Custom appBar
              appBar(
                showChatIcon: true,
                showNotificationIcon: true,
              ),
              Expanded(child: SingleChildScrollView(
                child: Column(children: [
                  HomeScreen(
                editOnTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditDoctorProfile();
                  }));
                },
                userModel: UserModel(
                  userName: "Sara Abdo",
                  userLocation: "Damietta",
                  userSchool: "El-Iman Islamic School",
                  userPhoneNumber: "01018548920",
                  userImage: "assets/images/personalImage.jpg",
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
                          "Supervised Children",
                          style: TextStyle(
                            fontSize: 23.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 90.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF7C86D4),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "Add profile",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    // List of Children
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.supervisedChildren.length, // Replace with actual item count
                      itemBuilder: (context, index) {
                        return customListTile(
                          userModel: widget.supervisedChildren[index],
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomeChildForOthers(
                                onTapForSend: (){},
                                userModel: widget.supervisedChildren[index]);
                            }));
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h)

                ],),
              ))
              , // Additional space for the bottom
            ],
          ),
      
      ),
    );
  }
}
