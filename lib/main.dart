import 'package:flutter/material.dart';
import 'package:the_natures_app/resource/intl_resource.dart';
import 'package:the_natures_app/resource/theme_resource.dart';

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
      theme: NatureTheme.getDefaultTheme(),
      home: const SplashScreen(),
    );
  }
}
