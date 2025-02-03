import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/unColoredButton.dart';

class VrScreen extends StatelessWidget {
  const VrScreen({
    super.key,
    required this.training,
    required this.progress,
  });

  final VoidCallback training;
  final VoidCallback progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 271.w,
            height: 300.h,
            child:
                Image(image: AssetImage("assets/images/vrTraining.png"))),
        ColoredButton(buttonText: "Training", onTap: training),
        unColoredButton(buttonText: "Progress", onTap: progress)
      ],
    );
  }
}
