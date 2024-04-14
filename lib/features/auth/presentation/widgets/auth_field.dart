import 'package:flutter/material.dart';
import 'package:spendify/core/theme/app_pallete.dart';
import 'package:spendify/core/theme/theme.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final bool isObscureText;
  final Color iconColor;
  final IconData icon;
  const AuthField({
    super.key,
    required this.hintText,
    this.isObscureText = false,
    this.iconColor = AppPallete.accentColor1,
    this.icon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 10,
            top: 5,
            bottom: 5,
          ), // Adjust horizontal padding as needed
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.getPrimaryTextColor(context),
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
              color: iconColor,
            ),
            child: Icon(
              icon,
              color: AppTheme.getPrimaryTextColor(context),
            ),
          ),
        ),
      ),
    );
  }
}
