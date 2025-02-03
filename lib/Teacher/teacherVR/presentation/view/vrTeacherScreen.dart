import 'package:flutter/material.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/feature/vrTraining/presentation/view/progress.dart';
import 'package:neuro_ninja/feature/vrTraining/presentation/view/training.dart';
import 'package:neuro_ninja/feature/vrTraining/presentation/widgets/VrScreen.dart';

class VrTeacherScreen extends StatefulWidget {
  const VrTeacherScreen({super.key});

  @override
  State<VrTeacherScreen> createState() => _VrTeacherScreenState();
}

class _VrTeacherScreenState extends State<VrTeacherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: Column(
        children: [
          appBar(
            showChatIcon: true,
            showNotificationIcon: true,
            showBackArrow: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: VrScreen(
                  training: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TrainingSchedule(
                        showAddButton: true,);
                    }));
                  },
                  progress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TrackProgress();
                    }));
                  }),
            ),
          )
        ],
      )),
    );
  }
}
