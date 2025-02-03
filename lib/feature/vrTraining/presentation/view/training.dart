import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/feature/vrTraining/presentation/view/notes.dart';
import 'package:neuro_ninja/feature/vrTraining/presentation/view_model/trainingSchedule.dart';
import 'package:neuro_ninja/feature/vrTraining/presentation/widgets/schrduleContainer.dart';

class TrainingSchedule extends StatefulWidget {
  TrainingSchedule({super.key ,
   this.showAddButton = false});

  final bool showAddButton ;

  final List<Training> trainingSchedule = [
    Training(game: "Hidden Heroes", gameTime: "9 AM", onTap: () {}),
    Training(game: "Brain Boost", gameTime: "11 AM", onTap: () {}),
    Training(game: "Memory Quest", gameTime: "2 PM", onTap: () {}),
  ];

  @override
  State<TrainingSchedule> createState() => _TrainingScheduleState();
}

class _TrainingScheduleState extends State<TrainingSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(
              showBackArrow: true,
            ),
            Center(
              child: Text(
                "Training Schedule",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: widget.trainingSchedule.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return TrainingNotes();
                        }));
                      },
                      child: schedule(train: widget.trainingSchedule[index]));
                },
              ),
            ),
            if (widget.showAddButton)
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.trainingSchedule.add(
                      Training(
                          game: "New Game", gameTime: "4 PM", onTap: () {}),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFFAE85EE),
                ),
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
