import 'package:flutter/material.dart';

class ThemeState {
  final Color textColor;
  final Color backgroundColor;
  final String name;
  ThemeState(
      {required this.textColor,
      required this.backgroundColor,
      required this.name});

  factory ThemeState.dark() {
    return ThemeState(
      backgroundColor: const Color(0xFF000000),
      textColor: const Color(0xFFFFFFFF),
      name: "dart",
    );
  }
  factory ThemeState.light() {
    return ThemeState(
      backgroundColor: const Color(0xFFFFFFFF),
      textColor: const Color(0xFF000000),
      name: "light",
    );
  }
}
