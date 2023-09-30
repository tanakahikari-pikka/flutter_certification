import 'package:flutter/material.dart';
import 'package:the_natures_app/resource/intl_resource.dart';

import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: I18n().appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF40e0d0)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
