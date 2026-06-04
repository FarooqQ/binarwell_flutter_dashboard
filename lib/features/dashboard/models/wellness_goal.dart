import 'package:flutter/material.dart';

class WellnessGoal {
  const WellnessGoal({
    required this.title,
    required this.progress,
    required this.status,
    required this.icon,
  });

  final String title;
  final double progress;
  final String status;
  final IconData icon;
}


