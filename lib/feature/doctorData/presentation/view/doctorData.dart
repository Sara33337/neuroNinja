import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/textField.dart';
import 'package:neuro_ninja/core/widgets/unColoredButton.dart';
import 'package:neuro_ninja/feature/done/registrationDone.dart';

class DoctorData extends StatefulWidget {
  const DoctorData({super.key});

  @override
  State<DoctorData> createState() => _DoctorDataState();
}

class _DoctorDataState extends State<DoctorData> {
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
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                    
                  Center(
                    child: Text(
                      "Doctor Data",
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
                  CustomTextField(labelText: "Clinic / Hospital Name", width: 360),
                  CustomTextField(labelText: "Scool name", width: 360),
                  CustomTextField(
                      labelText: "Clinic / Hospital Address", width: 360),
                  CustomTextField(labelText: "Phone number", width: 360),
                  CustomTextField(labelText: "Field of specialization", width: 360),
                  CustomTextField(labelText: "Number of exprience", width: 360),
                  ColoredButton(
                      buttonText: "Confirm",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RegistrationDone(userRole: "Doctor",);
                        }));
                      }),
                  unColoredButton(
                      buttonText: "Back",
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  const SizedBox(
                    height: 50,
                  )
                  ],),
                ),
              )
              
            ],
          ),
        ),
    
    );
  }
}
