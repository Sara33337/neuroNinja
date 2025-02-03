import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/textField.dart';
import 'package:neuro_ninja/core/widgets/unColoredButton.dart';
import 'package:neuro_ninja/feature/done/registrationDone.dart';

class TeacherData extends StatefulWidget {
  const TeacherData({super.key});

  @override
  State<TeacherData> createState() => _TeacherDataState();
}

class _TeacherDataState extends State<TeacherData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar(),
          SizedBox(height: 55.h),
          Center(
            child: Text(
              "Teacher Data",
              style: TextStyle(
                fontSize: 32.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto",
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              CustomTextField(labelText: "Name", width: 200),
              CustomTextField(labelText: "Age", width: 100)
            ],
          ),
          CustomTextField(labelText: "Scool name", width: 360),
          CustomTextField(labelText: "National ID", width: 360),
          CustomTextField(labelText: "Phone number", width: 360),
          ColoredButton(buttonText: "Confirm", onTap: () {
            Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegistrationDone(userRole: "Teacher",);
                    }));
          }),
          unColoredButton(
              buttonText: "Back",
              onTap: () {
                Navigator.pop(context);
              })
        ],
      )),
    );
  }
}
