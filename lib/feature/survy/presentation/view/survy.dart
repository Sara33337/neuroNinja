import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/unColoredButton.dart';
import 'package:neuro_ninja/feature/survy/logic/services/fetchQuestions.dart';
import 'package:neuro_ninja/feature/survy/presentation/view/survyResult.dart';
import 'package:neuro_ninja/feature/survy/presentation/view_model/survyModel.dart';
import 'package:dio/dio.dart';

class Survy extends StatefulWidget {
  const Survy({super.key});

  @override
  State<Survy> createState() => _SurvyState();
}

class _SurvyState extends State<Survy> {
  late PageController _controller;
  int currentIndex = 0;
  late Future<List<SurvyQuestions>> futureQuestions;
  Map<String, int> userAnswers = {};

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    futureQuestions = SurveyService().fetchQuestions();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void scrollSurvy(List<SurvyQuestions> questions, int answer) async {
    String questionId = questions[currentIndex].id;
    userAnswers[questionId] = answer;

    if (currentIndex == questions.length - 1) {
      try {
        SurveyService surveyService = SurveyService();
        Map<String, dynamic> diagnosis =
             await surveyService.submitSurveyResponses(userAnswers);


        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SurvyResult(diagnosisData: diagnosis);
        }));
      } catch (e) {
        print("Error: $e");
      }
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBar(),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: IconButton(
                    onPressed: () {
                      if (currentIndex > 0) {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ),
              ),
              FutureBuilder<List<SurvyQuestions>>(
                future: futureQuestions,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.white));
                  } else if (snapshot.hasError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Failed to load questions. Please try again.",
                          style: TextStyle(color: Colors.red, fontSize: 18.sp),
                        ),
                        SizedBox(height: 20.h),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              futureQuestions =
                                  SurveyService().fetchQuestions();
                            });
                          },
                          child: Text("Retry"),
                        ),
                      ],
                    );
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "No questions available.",
                        style: TextStyle(color: Colors.red, fontSize: 18.sp),
                      ),
                    );
                  }

                  final questions = snapshot.data!;

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          questions.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      SizedBox(
                        height: 100.h, // Fixed height for the PageView
                        child: PageView.builder(
                          controller: _controller,
                          itemCount: questions.length,
                          onPageChanged: (int index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text(
                                  questions[index].question,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                      unColoredButton(
                        buttonText: "Never",
                        onTap: () => scrollSurvy(questions, 0),
                      ),
                      SizedBox(height: 10.h),
                      unColoredButton(
                        buttonText: "Rarely",
                        onTap: () => scrollSurvy(questions, 1),
                      ),
                      SizedBox(height: 10.h),
                      unColoredButton(
                        buttonText: "Sometimes",
                        onTap: () => scrollSurvy(questions, 2),
                      ),
                      unColoredButton(
                        buttonText: "Often",
                        onTap: () => scrollSurvy(questions, 3),
                      ),
                      SizedBox(height: 10.h),
                      unColoredButton(
                        buttonText: "Very often",
                        onTap: () => scrollSurvy(questions, 4),
                      ),
                      SizedBox(height: 70.h),
                    ],
                  );
                },
              ),
            ],
          ),
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
        color: const Color(0xFFF82FFA),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
