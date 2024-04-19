import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendify/core/theme/app_pallete.dart';
import 'package:spendify/core/common/widgets/appbutton_decoration.dart';
import 'package:spendify/core/theme/theme.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final VoidCallback onPressed;
  const AuthButton(
    this.buttonText, {
    super.key,
    this.color = AppPallete.accentColor1,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppButtonDecoration(
      color: color,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: AppPallete.transparentColor,
          shadowColor: AppPallete.transparentColor,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText.toUpperCase(),
          style: GoogleFonts.rubik(
            color: AppTheme.getPrimaryTextColor(context),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
