import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/NavBar.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';

import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';

class RegistrationDone extends StatelessWidget {
  const RegistrationDone({super.key , required this.userRole});
  final String userRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(alignment: Alignment.topLeft, child: appBar()),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Your \n Registeration \n is Completed",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: "Roboto",
              ),
            ),
            Container(
              width: 268.w,
              height: 268.h,
              margin: EdgeInsets.all(10),
              child: const Image(
                image: AssetImage("assets/images/registrationDone.png"),
                fit: BoxFit.fill,
              ),
            ),
            ColoredButton(
                buttonText: "Go to Home",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BottomNavBar(
                      userRole: userRole,
                    );
                  }));
                })
          ],
        ),
      )),
    );
  }
}
