import 'package:flutter/material.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/feature/vrTraining/presentation/view/progress.dart';
import 'package:neuro_ninja/feature/vrTraining/presentation/view/training.dart';
import 'package:neuro_ninja/feature/vrTraining/presentation/widgets/VrScreen.dart';

class VrChildScreen extends StatefulWidget {
  const VrChildScreen({super.key});

  @override
  State<VrChildScreen> createState() => _VrChildScreenState();
}

class _VrChildScreenState extends State<VrChildScreen> {
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
              child: VrScreen(
                training: (){
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TrainingSchedule();
                    }));
                },
                 progress: (){
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