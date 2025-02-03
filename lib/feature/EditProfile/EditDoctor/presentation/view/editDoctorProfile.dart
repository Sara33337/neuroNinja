import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/feature/EditProfile/presentation/widgets/EditPhoto.dart';
import 'package:neuro_ninja/feature/EditProfile/presentation/widgets/EditTextField.dart';

class EditDoctorProfile extends StatefulWidget {
  const EditDoctorProfile({super.key});

  @override
  State<EditDoctorProfile> createState() => _EditDoctorProfileState();
}

class _EditDoctorProfileState extends State<EditDoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: SingleChildScrollView(
            child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 84, left: 56, bottom: 25),
                child: Text(
                  "Edit profile",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              EditPhoto(),
              
              SizedBox(height: 20.h,),

              EditTextField(
                width: 360,
                title: "Name",
              ),
              EditTextField(width: 360, title: "Email"),
              EditTextField(width: 360, title: "Phone number"),
              EditTextField(width: 360, title: "Clinic / Hospital adress"),
              EditTextField(width: 360, title: "Clinic / Hospital name"),
              ColoredButton(buttonText: "Save changes", onTap: () {})
            ],
                    ),
                  ),
          )),
    );
  }
}