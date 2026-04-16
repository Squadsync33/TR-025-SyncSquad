import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const FakeJobDetectorApp());
}

class FakeJobDetectorApp extends StatelessWidget {
  const FakeJobDetectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobShield AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(), // The first screen as requested
    );
  }
}
