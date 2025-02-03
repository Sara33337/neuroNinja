import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/unColoredButton.dart';
import 'package:neuro_ninja/feature/survy/presentation/view/survyResult.dart';
import 'package:neuro_ninja/feature/survy/presentation/view_model/survyModel.dart';

class Survy extends StatefulWidget {
  const Survy({super.key});

  @override
  State<Survy> createState() => _SurvyState();
}

class _SurvyState extends State<Survy> {
  final List<SurvyQuestions> questions = [
    SurvyQuestions(
        question: "Does your child get easily distracted by external stimuli?"),
    SurvyQuestions(
        question:
            "Does your child have difficulty completing tasks or homework without interruptions?")
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

  void scrollSurvy() {
    if (currentIndex == questions.length - 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SurvyResult();
      }));
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
          child: Column(
        children: [
          appBar(
            
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                    onPressed: () {
                      _controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              questions.length,
              (index) => buildDot(index, context),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Expanded(
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
                  })),
          unColoredButton(
              buttonText: "Yes",
              onTap: () {
                scrollSurvy();
              }),
          SizedBox(
            height: 10.h,
          ),
          unColoredButton(
              buttonText: "MAYBE",
              onTap: () {
                scrollSurvy();
              }),
          SizedBox(
            height: 10.h,
          ),
          unColoredButton(
              buttonText: "NO",
              onTap: () {
                scrollSurvy();
              }),
          SizedBox(
            height: 70.h,
          )
        ],
      )),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5, top: 5),
      decoration: BoxDecoration(
        color: Color(0xFFF82FFA),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
