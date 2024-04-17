import 'package:flutter/material.dart';
import 'package:spendify/core/constant/app.config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:spendify/core/theme/theme.dart';
import 'package:spendify/features/auth/presentation/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: AppConfig.DB_URL, anonKey: AppConfig.DB_KEY);
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
      home: const LoginPage(),
    );
  }
}
