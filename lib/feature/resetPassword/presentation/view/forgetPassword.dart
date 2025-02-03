import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/textField.dart';
import 'package:neuro_ninja/feature/resetPassword/presentation/view/resetPassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
              "Forgot password?",
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
              "No worries, we`ll send you reset instructions.",
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
          const CustomTextField(labelText: "Enter your e-mail", width: 360),
          ColoredButton(
              buttonText: "Reset password",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResetPassword();
                }));
              })
        ],
      )),
    );
  }
}
