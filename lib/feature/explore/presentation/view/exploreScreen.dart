import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/feature/explore/presentation/view/onboardingScreen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: GradientBackground(
      child: Center( // Use Center for better alignment
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 288.w,
              height: 280.h,
              child: const Image(
                image: AssetImage("assets/images/splashLogo.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Text(
                "A new approach to diagnosing and supporting children with ADHD",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20.h), // Add spacing if needed
            ColoredButton(
              buttonText: "Explore",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  OnboardingScreen();
                }));
              },
            ),
          ],
        ),
      ),
    ),
  );
}

  
}

