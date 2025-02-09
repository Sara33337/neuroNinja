import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/unColoredButton.dart';
import 'package:neuro_ninja/feature/survy/presentation/view/survy.dart';

class SurvyResult extends StatelessWidget {
  final Map<String, dynamic> diagnosisData;

  const SurvyResult({super.key, required this.diagnosisData});

  @override
  Widget build(BuildContext context) {
    double overallProbability = diagnosisData["overall_probability"];
    double hyperactivity_percentage = diagnosisData["hyperactivity_percentage"];
    double inattention_percentage = diagnosisData["inattention_percentage"];
  

    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            appBar(showChatIcon: true, showNotificationIcon: true),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 353.w,
                        height: 353.h,
                        child: Image.asset("assets/images/survyResult.png"),
                      ),
                    

                      CustomRichText(
                        text: "Inttention percentage is ",
                          percentage: inattention_percentage),
                      
                        CustomRichText(
                        text: "Hyperactivity percentage is ",
                        percentage: hyperactivity_percentage),
                      
                        RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$overallProbability%",
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: const Color(0xFFF82FFA),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: " likelihood of having ADHD\n",
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            
                          ],
                        ),
                      ),

                    

                        

                      SizedBox(height: 20.h),
                      ColoredButton(
                        buttonText: "Make new survey",
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Survy()));
                        },
                      ),
                      SizedBox(height: 10.h),
                      unColoredButton(
                          buttonText: "Export as report", onTap: () {})
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

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.percentage,
    required this.text
  });

  final double percentage;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              fontSize: 22.sp, // Adjust size as needed
              color: Colors.white, // Change color for emphasis
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "$percentage% ",
            style: TextStyle(
              fontSize: 24.sp,
              color: const Color(0xFFF82FFA),
              fontWeight: FontWeight.w600,
            ),
          ),
      
        ],
      ),
    );
  }
}
