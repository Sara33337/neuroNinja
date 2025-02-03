import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';

class ResetPasswordDone extends StatelessWidget {
  const ResetPasswordDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Align(
          
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Align(
            alignment: Alignment.topLeft,
            child: appBar()),

            const SizedBox(height: 70,),

            Text("Done!" ,
            textAlign: TextAlign.center,
            style: TextStyle(
                      fontSize: 40.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto",
                    ),),

              Text("Your password has been reset" ,
            textAlign: TextAlign.center,
            style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                    ),),
            
            Container(
            width: 268.w,
            height: 268.h,
            margin: EdgeInsets.all(10),
            child: const Image(image: AssetImage("assets/images/resetpassDone.png"),
            fit: BoxFit.fill,),
            ),
            
            ColoredButton(buttonText: "Start", onTap: (){})],
                ),
        )),
    );
  }
}