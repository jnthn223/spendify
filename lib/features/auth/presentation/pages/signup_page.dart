import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendify/core/theme/app_pallete.dart';
import 'package:spendify/features/auth/presentation/widgets/auth_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: GoogleFonts.rubik(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            AuthField(
              hintText: 'Name',
              iconColor: AppPallete.accentColor2,
            ),
            SizedBox(height: 15),
            AuthField(
              hintText: 'Email',
              icon: Icons.email_outlined,
              iconColor: AppPallete.accentColor3,
            ),
            SizedBox(height: 15),
            AuthField(
              hintText: 'Password',
              isObscureText: true,
              icon: Icons.lock_open_outlined,
              iconColor: AppPallete.accentColor4,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
