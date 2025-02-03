import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/textField.dart';
import 'package:neuro_ninja/core/widgets/unColoredButton.dart';

class PermissionData extends StatelessWidget {
  const PermissionData({super.key , required this.onContinue});
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            appBar(
              showBackArrow: true,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Child Data",
                      style: TextStyle(
                        fontSize: 32.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextField(labelText: "User name", width: 360),
                  CustomTextField(labelText: "Scool name", width: 360),
                  CustomTextField(labelText: "Parent number", width: 360),
                  ColoredButton(
                    buttonText: "Continue",
                    onTap: onContinue,
                  ),
                  unColoredButton(
                    buttonText: "Back",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
