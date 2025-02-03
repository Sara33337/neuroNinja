import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/feature/vrTraining/presentation/widgets/progressContainer.dart';

class TrackProgress extends StatefulWidget {
  const TrackProgress({super.key});

  @override
  State<TrackProgress> createState() => _TrackProgressState();
}

class _TrackProgressState extends State<TrackProgress> {
   

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
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                )),
            
                 Column(
                    children: [
                    Text("Child’s Progress \n Report",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.sp,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w600,
                              ),),

                            

            
                              progressContainer(
                                progressed: "Focus",
                                
                              ),
            
                              
                              progressContainer(
                                progressed: "Auditory Memory",
                              
                              ),
            
                              
                              progressContainer(
                                progressed: "Visual Memory",
                              
                              )
                  ],),
            
              
              
                    ],
                  ),
          )),
    );
  }
}


