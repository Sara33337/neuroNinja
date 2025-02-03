import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/textField.dart';
import 'package:neuro_ninja/feature/done/resetPasswordDone.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           appBar(),
          SizedBox(height: 100.h),
          Center(
            child: Text(
              "New Password",
              style: TextStyle(
                fontSize: 30.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto",
              ),
            ),
          ),
          Center(
            child: Text(
              "please enter your new password",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          CustomTextField(
              labelText: "Enter new password",
              width: 360,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility,
                      color: Colors.white.withOpacity(0.60)))),
          CustomTextField(
              labelText: "Repeat your new password",
              width: 360,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility,
                      color: Colors.white.withOpacity(0.60)))),
          ColoredButton(
              buttonText: "Confirm password",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResetPasswordDone();
                }));
              })
        ],
      )),
    );
  }
}
