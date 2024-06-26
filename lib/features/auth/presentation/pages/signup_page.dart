import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendify/core/common/widgets/loader.dart';
import 'package:spendify/core/theme/app_pallete.dart';
import 'package:spendify/core/utils/show_snackbar.dart';
import 'package:spendify/features/auth/domain/validation/auth.schema.dart';
import 'package:spendify/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:spendify/features/auth/presentation/pages/login_page.dart';
import 'package:spendify/features/auth/presentation/widgets/auth_button.dart';
import 'package:spendify/features/auth/presentation/widgets/auth_field.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                showSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Loader();
              }
              return Form(
                key: formKey,
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
                    const SizedBox(height: 30),
                    AuthField(
                      hintText: 'Name',
                      iconColor: AppPallete.accentColor2,
                      controller: nameController,
                      validator: AuthValidationSchema.nameValidator,
                    ),
                    const SizedBox(height: 15),
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
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthSignUp(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  name: nameController.text.trim(),
                                ),
                              );
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, SignUpPage.route());
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppPallete.accentColor1,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
