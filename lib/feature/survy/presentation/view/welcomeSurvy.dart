import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/permissionData.dart';
import 'package:neuro_ninja/feature/survy/presentation/view/survy.dart';

class WelcomeToSurvy extends StatefulWidget {
  const WelcomeToSurvy({super.key});

  @override
  State<WelcomeToSurvy> createState() => _WelcomeToSurvyState();
}

class _WelcomeToSurvyState extends State<WelcomeToSurvy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            appBar(
              showChatIcon: true,
              showNotificationIcon: true,
            ),
            Container(
                width: 271.w,
                height: 271.h,
                child: Image(image: AssetImage("assets/images/survy.png"))),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "You're about to take a quick survey to help assess if your child shows signs of ADHD. \n Answer the questions with",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    "Yes, Maybe, or No.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: Color(0xFFF276D7),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    "Your responses will give an initial insight into your child’s behavior.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            ColoredButton(
                buttonText: "Let's get started!",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PermissionData(
                      onContinue: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Survy();
                      }));
                    });
                  }));
                }),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      )),
    );
  }
}
