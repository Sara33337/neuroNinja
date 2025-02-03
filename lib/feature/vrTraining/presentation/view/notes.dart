import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/feature/vrTraining/presentation/widgets/addNote.dart';


class TrainingNotes extends StatefulWidget {
  const TrainingNotes({super.key});

  @override
  State<TrainingNotes> createState() => _TrainingNotesState();
}

class _TrainingNotesState extends State<TrainingNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(children: [
          appBar(showBackArrow: true,),

            Center(
              child: Text(
                "Notes",
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  return AddNote();
                },
              ),
            ),
        ],)),
    );
  }
}

