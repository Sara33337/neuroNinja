import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNote extends StatelessWidget {
  const AddNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Container(
      width: 65.w,
      height: 65.h,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: const Color(0xFFA11BD5),
      width: 2,
    ),
    image: const DecorationImage(
      image: AssetImage("assets/images/personalImage.jpg"),
      fit: BoxFit.fill,
    ),
                    ),),
    
                    Container(
                    width: 267.w,
                    height: 88.h,
                    margin: EdgeInsets.only(left: 5 , top: 25 , right: 7),
                    decoration: BoxDecoration(
    color: Color(0xFFABADAC).withOpacity(0.20),
    borderRadius: BorderRadius.circular(16.r)
                    ),
    
                    child: Column(
    children: [
      TextField(
        decoration: InputDecoration(
            contentPadding:
         EdgeInsets.only(left: 21, top: 19, bottom: 19, right: 30),
          hintText: "Add your note",
         hintStyle: TextStyle(
        fontSize: 16.sp,
         color: Colors.white.withOpacity(0.40),),
         border: InputBorder.none, // Removes the default border
         enabledBorder: InputBorder.none, // Removes the enabled border
        focusedBorder: InputBorder.none,
      
               
        ),
        
      ),
    
      TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        side: BorderSide(color: Color(0xFFA11BD5)), // Pink border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Optional rounded corners
        ),
      ),
      child: Text(
        "Save",
        style: TextStyle(
          color: Colors.white, // White text color
          fontSize: 10.sp, // Adjust size as needed
        ),
      ),
    ),
    ],
                    ),)
    ],);
  }
}