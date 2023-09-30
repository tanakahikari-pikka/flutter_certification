import 'package:flutter/material.dart';

class NatureTheme {
  static ThemeData getDefaultTheme(Brightness brightness) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF40e0d0)),
      useMaterial3: true,
      textTheme: const TextTheme(),
    );
  }
}
