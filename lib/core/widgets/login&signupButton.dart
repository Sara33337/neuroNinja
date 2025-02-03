import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class login_signu_with extends StatelessWidget {
  const login_signu_with({
    super.key,
    required this.logoImage,
    required this.buttonText,
    required this.onTap
    
  });
  final String logoImage;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 18, right: 18, top: 10 , bottom: 10),
        height: 46.h,
        width: 361.w,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF7C86D4), width: 1),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                  color:
                      const Color.fromARGB(255, 71, 69, 69).withOpacity(0.01))
            ]),
        child: TextButton(
            onPressed: () {
              onTap();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  child: Image(
                    image: AssetImage(logoImage),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  buttonText,
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                        fontFamily: "Roboto"),
                )
              ],
            )));
  }
}
