import 'package:flutter/material.dart';

class VitalMetric {
  const VitalMetric({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;
}
