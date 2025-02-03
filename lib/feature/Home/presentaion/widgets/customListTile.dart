import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neuro_ninja/feature/Home/presentaion/view_model/userModel.dart';

class customListTile extends StatelessWidget {
  const customListTile({
    super.key,
    required this.onTap,
    required this.userModel,
  });

  final UserModel userModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 76.w,
            height: 76.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFA11BD5),
                width: 1.0,
              ),
              image: DecorationImage(
                image: AssetImage(userModel.userImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              userModel.userName,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto",
              ),
              overflow: TextOverflow.ellipsis, // Handle overflow gracefully
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 90.w,
            height: 27.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Handle edit action
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/edit.svg',
                    color: Colors.black,
                    width: 14.w,
                    height: 14.h,
                  ),
                ),
                const VerticalDivider(thickness: 0.3),
                IconButton(
                  onPressed: () {
                    // Handle delete action
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/trash.svg',
                    color: Colors.red,
                    width: 14.w,
                    height: 14.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
