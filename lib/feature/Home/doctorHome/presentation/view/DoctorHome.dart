import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  const HomeDoctor({super.key});

  @override
  State<HomeDoctor> createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserModel? userModel;
  bool isLoading = true;
  String? errorMessage;

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
  void initState() {
    super.initState();
    _fetchDoctorData();
  }

  Future<void> _fetchDoctorData() async {
    try {
      String? userId = _auth.currentUser?.uid;
      if (userId == null) {
        setState(() {
          isLoading = false;
          errorMessage = "User not logged in.";
        });
        return;
      }

      DocumentSnapshot snapshot = await _firestore.collection('doctors').doc(userId).get();

      if (!snapshot.exists) {
        setState(() {
          isLoading = false;
          errorMessage = "No doctor data found.";
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
          userLocation: data['userLocation'] ?? "N/A",
        );
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = "Error fetching doctor data: $e";
      });
    }
  }

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeScreen(
                      editOnTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return EditDoctorProfile();
                        }));
                      },
                      userModel: userModel ??
                          UserModel(
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
                            itemCount: supervisedChildren.length,
                            itemBuilder: (context, index) {
                              return customListTile(
                                userModel: supervisedChildren[index],
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return HomeChildForOthers(
                                      onTapForSend: () {},
                                      userModel: supervisedChildren[index],
                                    );
                                  }));
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
