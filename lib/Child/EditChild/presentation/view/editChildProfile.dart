import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/feature/EditProfile/presentation/widgets/EditPhoto.dart';
import 'package:neuro_ninja/feature/EditProfile/presentation/widgets/EditTextField.dart';

class EditChildProfile extends StatefulWidget {
  const EditChildProfile({super.key});

  @override
  State<EditChildProfile> createState() => _EditChildProfileState();
}

class _EditChildProfileState extends State<EditChildProfile> {
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
              Row(
                children: [
                  EditTextField(width: 360, title: "City"),
                  EditTextField(width: 77, title: "Age")
                ],
              ),
              EditTextField(width: 360, title: "School name"),
              
              ColoredButton(buttonText: "Save changes", onTap: () {})
            ],
                    ),
                  ),
          )),
    );
  }
}