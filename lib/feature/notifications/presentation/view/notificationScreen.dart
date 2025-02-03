import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/feature/notifications/presentation/widgets/notication.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(child: 
      Column(
        children: [
        appBar(showBackArrow: true,
        showChatIcon: true,
        showNotificationIcon: true,),
        Text("Notifications", 
        style: TextStyle(
        fontSize: 30.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: "Roboto" ),),

        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
                   notification(),
                  notification(),
                  notification(),
                  notification(),
                  
            ],),
          ),
        )

      

    

      ],)),
    );
  }
}

