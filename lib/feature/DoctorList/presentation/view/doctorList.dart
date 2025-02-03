import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/selectDoctor.dart';
import 'package:neuro_ninja/core/widgets/textField.dart';
import 'package:neuro_ninja/feature/Home/presentaion/view_model/userModel.dart';
import 'package:neuro_ninja/feature/homeFORothers/DoctorHomeForOthers/presentation/view/DoctorHomeForOthers.dart';

class DoctorList extends StatefulWidget {
  DoctorList({super.key});

  final List<UserModel> doctors = [
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
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Center(
                child: Text(
                  "Doctor List",
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomTextField(
                labelText: "Search",
                width: double.infinity,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: widget.doctors.length, // Replace with your actual data length

                itemBuilder: (context, index) {
                  return SelectDoctor(
                    userModel: widget.doctors[index],
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) {
                        return DoctorHomeForOthers(
                            userModel: widget.doctors[index],
                            onTapForSend: () {});
                      }));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
