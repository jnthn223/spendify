import 'package:flutter/material.dart';
import 'package:spendify/core/theme/theme.dart';
import 'package:spendify/features/auth/presentation/pages/signup_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spendify',
      theme: AppTheme.getTheme(context),
      home: const SignUpPage(),
    );
  }
}
