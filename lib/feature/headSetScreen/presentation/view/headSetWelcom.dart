import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/permissionData.dart';
import 'package:neuro_ninja/feature/headSetScreen/presentation/view/EnterEggData.dart';

class HeadSetWelcom extends StatefulWidget {
  const HeadSetWelcom({super.key});

  @override
  State<HeadSetWelcom> createState() => _HeadSetWelcomState();
}

class _HeadSetWelcomState extends State<HeadSetWelcom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            appBar(
              showChatIcon: true,
              showNotificationIcon: true,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 335.w,
                      height: 335.h,
                      child: Image(
                        image: AssetImage("assets/images/headSet.png"),
                      ),
                    ),
                    ColoredButton(
                      buttonText: "Let's get started!",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PermissionData(onContinue: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return EGGInputScreen();
                            }));
                          });
                        }));
                      },
                    ),
                  ],
                ),
              ),
            )

            // Image
          ],
        ),
      ),
    );
  }
}
