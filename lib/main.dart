// main.dart
import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/properties/app_theme.dart' show AppTheme;
import 'package:recycling_flutter_app/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}