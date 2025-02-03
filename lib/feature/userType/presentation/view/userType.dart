import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/Child/childData/presentation/view/childData.dart';
import 'package:neuro_ninja/feature/doctorData/presentation/view/doctorData.dart';
import 'package:neuro_ninja/Teacher/teacherData/presentation/view/teacherData.dart';

class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 70, left: 29, right: 29, bottom: 6),
                child: Center(
                  child: Text(
                    "Please Select one of the following",
                    style: TextStyle(
                      fontSize: 19.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "You are",
                  style: TextStyle(
                    fontSize: 19.sp,
                    color: Color(0xFFB95DEE),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                          
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ChildData();
                            }));
                          },
                          child: Image(
                              image: AssetImage("assets/images/child.png"))),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Child",
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return TeacherData();
                            }));
                          },
                          child: Image(
                              image: AssetImage("assets/images/teacher.png"))),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Teacher",
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DoctorData();
                            }));
                          },
                          child: Image(
                              image: AssetImage("assets/images/doctor.png"))),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Doctor",
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 80,
              ),
              ColoredButton(buttonText: "Select", onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
