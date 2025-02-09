import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  const HomeChild({super.key});

  @override
  State<HomeChild> createState() => _HomeChildState();
}

class _HomeChildState extends State<HomeChild> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  UserModel? userModel;
  bool isLoading = true;
  String? errorMessage;

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
  void initState() {
    super.initState();
    _fetchChildData();
  }

  Future<void> _fetchChildData() async {
    try {
      String? userId = _auth.currentUser?.uid;
      if (userId == null) {
        setState(() {
          isLoading = false;
          errorMessage = "User not logged in.";
        });
        return;
      }

      DocumentSnapshot snapshot =
          await _firestore.collection('children').doc(userId).get();
      
      if (!snapshot.exists) {
        setState(() {
          isLoading = false;
          errorMessage = "No child data found.";
        });
        return;
      }

      var data = snapshot.data() as Map<String, dynamic>? ?? {};

      userModel = UserModel(
        userAge: data['age']?? '12',
        userName: data['name'] ?? 'sa',
        userLocation: data['userLocation']??'sss',
        userSchool: data['school'] ?? 'llf',
        userPhoneNumber: data['parentNumber'] ?? 'kkkk',
        userImage: 'assets/images/personalImage.jpg',
      );

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = "Error fetching child data: $e";
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditChildProfile(),
                            ),
                          );
                        },
                        userModel: userModel ?? 
                          UserModel(
      userName: "Ibrahim ElNagar",
      userLocation: "Damietta",
      userSchool: "El-Iman Islamic School",
      userPhoneNumber: "01018548920",
      userImage: "assets/images/personalImage.jpg",
    )
                      ),
                    SizedBox(height: 45.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Followed by",
                            style: TextStyle(
                              fontSize: 23.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto",
                            ),
                          ),
                          SizedBox(height: 10.h),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: followedBy.length,
                            itemBuilder: (context, index) {
                              return customListTile(
                                userModel: followedBy[index],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TeacherHomeForOthers(
                                        userModel: followedBy[index],
                                        onTapForSend: () {},
                                      ),
                                    ),
                                  );
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
