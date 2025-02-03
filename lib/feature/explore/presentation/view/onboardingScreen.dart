import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appStyle.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/feature/explore/presentation/view_model/onboardingModel.dart';
import 'package:neuro_ninja/feature/login/presentation/view/LoginScreen.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenEEGState();
}

class _OnboardingScreenEEGState extends State<OnboardingScreen> {
  final List<OnboardingModel> contents = [
    OnboardingModel(
        topText: "Measuring Brain Signals using EEG signals",
        onboardingImage: "assets/images/boardingEEG.png",
        bottomText:
            "A playful approach to tracking EEG waves in helping diagnose and support ADHD with comfort and care",
        onTap: () {}),
    OnboardingModel(
        topText: "Quick Survey to Assess ADHD",
        onboardingImage: "assets/images/boardingSurvey.png",
        bottomText:
            "Answer a few yes or no questions about your child's attention, focus, and behavior to get insights into potential ADHD symptoms.",
        onTap: () {}),
    OnboardingModel(
        topText: "list of top ADHD specialists",
        onboardingImage: "assets/images/boardingDoctorList.png",
        bottomText:
            "Our platform connects you with expert doctors making it easy to find the right support for your child’s unique needs.",
        onTap: () {}),
    OnboardingModel(
        topText: "Your child can now train using Virtual Reality (VR)",
        onboardingImage: "assets/images/onboardingVR.png",
        bottomText:
            "Monitor their progress and track every training session in real-time with acces for both parents and doctors",
        onTap: () {}),
    OnboardingModel(
        topText: "Smart Chatbot for ADHD Support",
        onboardingImage: "assets/images/onboardingChatbot.png",
        bottomText:
            "The chatbot can help you understand child's needs and offer tips on how to support them. It's available anytime to provide guidance and resources for you.",
        onTap: () {})
  ];

  @override
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: Text(
                          contents[index].topText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21.sp,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        width: 288.w,
                        height: 280.h,
                        child: Image(
                          image: AssetImage(contents[index].onboardingImage),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 27, vertical: 20),
                        child: Text(
                          contents[index].bottomText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              height: 46.h,
              width: 361.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: AppStyle().buttonColor),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.25),
                  )
                ],
              ),
              child: TextButton(
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  currentIndex == contents.length - 1 ? "Continue" : "Next",
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              height: 46.h,
              width: 361.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFFB95DEE), width: 1),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                    color:
                        const Color.fromARGB(255, 71, 69, 69).withOpacity(0.1),
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  contents[currentIndex].onTap();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5, top: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 167, 107, 184),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
