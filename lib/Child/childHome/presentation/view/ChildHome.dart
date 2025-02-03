import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/Child/EditChild/presentation/view/editChildProfile.dart';
import 'package:neuro_ninja/feature/Home/presentaion/view_model/userModel.dart';
import 'package:neuro_ninja/feature/Home/presentaion/widgets/customListTile.dart';
import 'package:neuro_ninja/feature/Home/presentaion/view/HomeScreen.dart';
import 'package:neuro_ninja/Teacher/TeacherhomeFORothers/presentation/view/TeacherHomeForOther.dart';

class HomeChild extends StatefulWidget {
  HomeChild({
    super.key,
    this.userModel,
  });

  final UserModel? userModel;

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
  State<HomeChild> createState() => _HomeChildState();
}

class _HomeChildState extends State<HomeChild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            appBar(
              showChatIcon: true,
              showNotificationIcon: true,
            ),

            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeScreen(
                    editOnTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditChildProfile();
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
                          itemCount: widget.followedBy
                              .length, // Replace with actual item count
                          itemBuilder: (context, index) {
                            return customListTile(
                              userModel: widget.followedBy[index],
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return TeacherHomeForOthers(
                                      userModel: widget.followedBy[index],
                                      onTapForSend: () {});
                                }));
                              },
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
            // Additional space for the bottom
          ],
        ),
      ),
    );
  }
}
