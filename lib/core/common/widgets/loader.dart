import 'package:flutter/material.dart';
import 'package:spendify/core/theme/app_pallete.dart';
import 'package:spendify/core/theme/theme.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: AppTheme.getPrimaryTextColor(context).withOpacity(0.5),
        color: AppPallete.accentColor1,
      ),
    );
  }
}
