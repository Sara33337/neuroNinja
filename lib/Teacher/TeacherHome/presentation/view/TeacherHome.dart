import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/Teacher/EditTeacher/presentation/view/editTeacherProfile.dart';
import 'package:neuro_ninja/feature/Home/presentaion/view_model/userModel.dart';
import 'package:neuro_ninja/feature/Home/presentaion/widgets/customListTile.dart';
import 'package:neuro_ninja/feature/Home/presentaion/view/HomeScreen.dart';
import 'package:neuro_ninja/Child/childData/presentation/view/childData.dart';
import 'package:neuro_ninja/Child/ChildhomeFORother/presentation/childHomeForOthers.dart';

class HomeTeacher extends StatefulWidget {
  HomeTeacher({super.key});

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
  State<HomeTeacher> createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {
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
                        return EditProfileTeacher();
                      }));
                    },
                    userModel: UserModel(
                      userName: "Sherif Sedik",
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
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ChildData(
                                      add_OR_confirm: "Add",
                                      backTap: () => Navigator.pop(context),
                                      confirmTap: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "Added Successfully",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            backgroundColor: Color(0xFFADADAD),
                                            behavior: SnackBarBehavior.floating,
                                            duration: Duration(seconds: 3),
                                          ),
                                        );
                                        Navigator.pop(context);
                                      });
                                }));
                              },
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
                          itemCount: widget.supervisedChildren
                              .length, // Replace with actual item count
                          itemBuilder: (context, index) {
                            return customListTile(
                              userModel: widget.supervisedChildren[index],
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomeChildForOthers(
                                    onTapForSend: (){},
                                      userModel:
                                          widget.supervisedChildren[index]);
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
          ],
        ),
      ),
    );
  }
}
