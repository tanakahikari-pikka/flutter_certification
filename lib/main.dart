import 'package:flutter/material.dart';
import 'package:the_natures_app/resourse/theme_resource.dart';

import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const brightness = Brightness.light;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Natures',
      theme: NatureTheme.getDefaultTheme(brightness),
      home: const SplashScreen(),
    );
  }
}
