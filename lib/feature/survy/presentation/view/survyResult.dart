import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/unColoredButton.dart';
import 'package:neuro_ninja/feature/survy/presentation/view/survy.dart';


class SurvyResult extends StatefulWidget {
  const SurvyResult({super.key});

  @override
  State<SurvyResult> createState() => _SurvyResultState();
}

class _SurvyResultState extends State<SurvyResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: Column(
        children: [
          appBar(showChatIcon: true,
                showNotificationIcon: true,),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                        width: 353.w,
                        height: 353.h,
                        child: Image(
                            image: AssetImage("assets/images/survyResult.png"))),
                    const Text(
                      "75% likelihood of having ADHD",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ColoredButton(
                        buttonText: "Make new survy",
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Survy();
                          }));
                        }),
                    unColoredButton(buttonText: "Export as report", onTap: (){})
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
