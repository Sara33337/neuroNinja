import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/feature/explore/presentation/view/exploreScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ExploreScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(child: Image(image: AssetImage("assets/images/splashLogo.png"))),)
      
    );
  }
}
