import 'package:flutter/material.dart';

class OnboardingModel {
  final String onboardingImage;
  final String topText;
  final String bottomText;
  final VoidCallback onTap;

  OnboardingModel(
      {required this.topText,
      required this.onboardingImage,
      required this.bottomText,
      required this.onTap});
}
