import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendify/core/theme/app_pallete.dart';
import 'package:spendify/features/auth/domain/validation_schemas/auth.schema.dart';
import 'package:spendify/features/auth/presentation/pages/signup_page.dart';
import 'package:spendify/features/auth/presentation/widgets/auth_button.dart';
import 'package:spendify/features/auth/presentation/widgets/auth_field.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      );
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign In',
                  style: GoogleFonts.rubik(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                AuthField(
                  hintText: 'Email',
                  icon: Icons.email_outlined,
                  iconColor: AppPallete.accentColor3,
                  controller: emailController,
                  validator: AuthValidationSchema.emailValidator,
                ),
                const SizedBox(height: 15),
                AuthField(
                  hintText: 'Password',
                  isObscureText: true,
                  icon: Icons.lock_open_outlined,
                  iconColor: AppPallete.accentColor4,
                  controller: passwordController,
                  validator: AuthValidationSchema.passwordValidator,
                ),
                const SizedBox(height: 30),
                AuthButton(
                  'Sign Up',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, LoginPage.route());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account yet? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppPallete.accentColor1,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
