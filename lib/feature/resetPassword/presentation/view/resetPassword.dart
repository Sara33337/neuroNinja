import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/passwordReset.dart';
import 'package:neuro_ninja/feature/resetPassword/presentation/view/newPassword.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
              "Password Reset",
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
              "We sent code to someone@gmail.com",
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              passwordReset(),
              passwordReset(),
              passwordReset(),
              passwordReset()
            ],
          ),
          ColoredButton(
              buttonText: "Continue",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewPassword();
                }));
              }),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive the email ? ",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                ),
              ),
              Text(
                "Click to resend",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xFFB95DEE),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Roboto",
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
