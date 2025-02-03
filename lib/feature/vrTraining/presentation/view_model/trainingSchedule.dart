import 'package:flutter/material.dart';

class Training {
  final String game;
  final String gameTime;
  final VoidCallback onTap;

  Training({
    required this.game, required this.gameTime, 
  required this.onTap});
}
