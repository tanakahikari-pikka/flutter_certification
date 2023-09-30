import 'package:flutter/material.dart';

class NatureTheme {
  static ThemeData getDefaultTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF40e0d0)),
      useMaterial3: true,
    );
  }
}
