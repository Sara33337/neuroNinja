import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/feature/headSetScreen/presentation/view/showResults.dart';

class EGGInputScreen extends StatefulWidget {
  @override
  _EGGInputScreenState createState() => _EGGInputScreenState();
}

class _EGGInputScreenState extends State<EGGInputScreen> {
  bool showSendButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            appBar(
              showBackArrow: true,
              showChatIcon: true,
              showNotificationIcon: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        "Attach CSV File",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 50.h),
                      ColoredButton(
                        buttonText: "Select CSV File",
                        onTap: () {
                          setState(() {
                            showSendButton = true;
                          });
                        },
                      ),
                      SizedBox(height: 30.h),
                      if (showSendButton)
                        ColoredButton(
                            buttonText: "Send",
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ShowResult();
                              }));
                            })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
