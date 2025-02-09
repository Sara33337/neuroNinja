import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/unColoredButton.dart';
import 'package:neuro_ninja/feature/headSetScreen/logic/services/apiService.dart';
import 'package:neuro_ninja/feature/headSetScreen/presentation/view/shareHS_Data.dart';
import 'dart:async';

class ShowResult extends StatefulWidget {
  final String fileName; // File name to send in the GET request

  const ShowResult({super.key, required this.fileName});

  @override
  State<ShowResult> createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {
  bool _isLoading = true;
  int? _predictionData;

  @override
  void initState() {
    super.initState();
    _fetchPredictionData();
  }

  Future<void> _fetchPredictionData() async {
    ApiService apiService = ApiService();
    var predictionData = await apiService.getPrediction(widget.fileName);

    setState(() {
      _predictionData = predictionData; // Assuming `predictionData` is an integer representing confidence
      _isLoading = false;
    });
  }

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 335.w,
                      height: 335.h,
                      child: Image(
                        image: AssetImage("assets/images/headSet.png"),
                      ),
                    ),
                    _isLoading
                        ? CircularProgressIndicator() // Show loading indicator while fetching
                        : _predictionData != null
                            ? Column(
                                children: [
                                  Text(
                                    // Display the prediction result based on the value of _predictionData
                                    _predictionData == 0
                                        ? "No likelihood of having ADHD"
                                        : "Likely to have ADHD",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Roboto",
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              )
                            : Text(
                                "Failed to fetch prediction data",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                    // Uncomment the share button if needed
                    // ColoredButton(
                    //   buttonText: "Share Data",
                    //   onTap: () {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) {
                    //       return ShareHSData();
                    //     })); 
                    //   },
                    // ),
                    unColoredButton(
                      buttonText: "Export as report",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
