import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/feature/Home/presentaion/view_model/userModel.dart';

class SelectDoctor extends StatefulWidget {
  final bool showCheckbox;

  const SelectDoctor(
      {super.key, this.showCheckbox = false, 
      required this.onTap, 
      required this.userModel});
      
  final VoidCallback onTap;
  final UserModel userModel;

  @override
  State<SelectDoctor> createState() => _SelectDoctorState();
}

class _SelectDoctorState extends State<SelectDoctor> {
  bool isChecked = false;

  void toggleCheck() {
    setState(() {
      isChecked = !isChecked; // Toggle the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 87.h,
        width: 356.w,
        margin: EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: Color(0xFFABADAC).withOpacity(0.20),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Show the checkbox only if `showCheckbox` is true
            if (widget.showCheckbox)
              IconButton(
                onPressed: toggleCheck,
                icon: isChecked
                    ? Icon(Icons.check_box)
                    : Icon(Icons.check_box_outline_blank),
                color: Colors.white,
                iconSize: 27,
              ),
            Container(
              width: 46.w,
              height: 46.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFA11BD5),
                  width: 1.5,
                ),
                image: const DecorationImage(
                  image: AssetImage("assets/images/personalImage.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userModel.userName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto",
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.location_pin),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      widget.userModel.userLocation!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto",
                      ),
                    )
                  ],
                ),
              ],
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemSize: 28,
              itemCount: 4,
              itemPadding: EdgeInsets.symmetric(horizontal: 2),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )
          ],
        ),
      ),
    );
  }
}
