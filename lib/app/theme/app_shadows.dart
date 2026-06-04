import 'package:flutter/material.dart';

abstract final class AppShadows {
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x1A0F172A),
      blurRadius: 22,
      spreadRadius: -2,
      offset: Offset(0, 10),
    ),
  ];

  static const List<BoxShadow> panel = [
    BoxShadow(
      color: Color(0x1F0F172A),
      blurRadius: 30,
      spreadRadius: -3,
      offset: Offset(0, 14),
    ),
  ];
}


