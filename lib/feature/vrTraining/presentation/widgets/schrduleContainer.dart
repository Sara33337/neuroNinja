import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/feature/vrTraining/presentation/view_model/trainingSchedule.dart';

class schedule extends StatelessWidget {
  const schedule({super.key,
   required this.train});
  final Training train;

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 63.h,
        width: 356.w,
        margin: EdgeInsets.all(17),
        decoration: BoxDecoration(
            color: Color(0xFFABADAC).withOpacity(0.20),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(train.game,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                )),
            Text(train.gameTime,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
      )
    ;
  }
}
