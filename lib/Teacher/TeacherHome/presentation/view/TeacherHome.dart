import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  

  

  @override
  State<HomeTeacher> createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  UserModel? userModel;
  bool isLoading = true;
  String? errorMessage;

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
  void initState() {
    super.initState();
    _fetchTeacherData();
  }

  Future<void> _fetchTeacherData() async {
  try {
    String? userId = _auth.currentUser?.uid;
    if (userId == null) {
      setState(() {
        isLoading = false;
        errorMessage = "User not logged in.";
      });
      return;
    }

    DocumentSnapshot snapshot = await _firestore.collection('teachers').doc(userId).get();
    
    if (!snapshot.exists) {
      setState(() {
        isLoading = false;
        errorMessage = "No teacher data found.";
      });
      return;
    }

    var data = snapshot.data() as Map<String, dynamic>? ?? {};
    
    setState(() {
      userModel = UserModel(
        userAge: data['age'] ?? 'N/A',
        userName: data['name'] ?? 'Unknown',
        userSchool: data['school'] ?? 'Unknown',
        userPhoneNumber: data['phoneNumber'] ?? 'N/A',
        userNationalID: data['nationalID'] ?? "N/A",
        userImage: 'assets/images/personalImage.jpg',
        userLocation: data['userLocation'] ?? "NA"
      );
      isLoading = false;
    });

  } catch (e) {
    setState(() {
      isLoading = false;
      errorMessage = "Error fetching teacher data: $e";
    });
  }
}


  

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
                  if (isLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (errorMessage != null)
                      Center(
                        child: Text(
                          errorMessage!,
                          style: TextStyle(color: Colors.red, fontSize: 16.sp),
                        ),
                      )
                    else
                  HomeScreen(
                    editOnTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditProfileTeacher();
                      }));
                    },
                    userModel: userModel ?? UserModel(
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
                          itemCount: supervisedChildren
                              .length, // Replace with actual item count
                          itemBuilder: (context, index) {
                            return customListTile(
                              userModel: supervisedChildren[index],
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomeChildForOthers(
                                    onTapForSend: (){},
                                      userModel:
                                          supervisedChildren[index]);
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
