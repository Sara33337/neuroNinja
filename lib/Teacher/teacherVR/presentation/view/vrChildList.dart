import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/Teacher/teacherVR/presentation/widgets/selectChild.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/textField.dart';

class VrChildList extends StatefulWidget {
  const VrChildList({super.key});

  @override
  State<VrChildList> createState() => _VrChildListState();
}

class _VrChildListState extends State<VrChildList> {
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Center(
                child: Text(
                  "Trained children",
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomTextField(
                labelText: "Search",
                width: double.infinity,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: 3, 

                itemBuilder: (context, index) {
                  return  SelectChild();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

