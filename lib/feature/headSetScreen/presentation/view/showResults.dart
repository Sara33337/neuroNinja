import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/unColoredButton.dart';
import 'package:neuro_ninja/feature/headSetScreen/presentation/view/shareHS_Data.dart';

class ShowResult extends StatefulWidget {
  const ShowResult({super.key});

  @override
  State<ShowResult> createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {
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
                    Text(
                      "92% likelihood of having ADHD",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto",
                      ),
                    ),
                    // ColoredButton(
                    //   buttonText: "Share Data",
                    //   onTap: () {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) {
                    //       return ShareHSData();
                    //     }));
                    //   },
                    // ),
                    unColoredButton(
                        buttonText: "Export  as report ", onTap: () {})
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
