import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class progressContainer extends StatefulWidget {
  const progressContainer({
    super.key,
    required this.progressed,
    
  });

  final String progressed;

  @override
  State<progressContainer> createState() => _progressContainerState();
}

class _progressContainerState extends State<progressContainer> {
  double _progress = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107.h,
      width: 360.w,
      margin: EdgeInsets.all(17),
      decoration: BoxDecoration(
          color: Color(0xFFABADAC).withOpacity(0.20),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.progressed,
              
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
              Center(
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            setState(() {
              // Calculate new progress based on drag position
              _progress += details.delta.dx / 2;
              _progress = _progress.clamp(0, 100); // Keep progress in bounds
            });
          },
          child: Container(
            width: 288.w,
            height: 21.h,
            decoration: const BoxDecoration(
              boxShadow: [BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 0.5)

              )],
              color: Color(0xFFC9C3C3),
            ),
            child: Stack(
              children: [
                // Active gradient progress
                FractionallySizedBox(
                  widthFactor: _progress / 100,
                  child: Container(
                    decoration: const BoxDecoration(
                      
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFCE18FF), 
                          Color(0xFF430098)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
                // Optional: Progress value overlay
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${_progress.toStringAsFixed(0)}%",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
          ],
        ),
      ),
    );
  }
}
