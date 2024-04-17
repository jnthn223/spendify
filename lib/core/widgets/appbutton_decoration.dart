import 'package:flutter/material.dart';
import 'package:spendify/core/theme/app_pallete.dart';
import 'package:spendify/core/theme/theme.dart';

class AppButtonDecoration extends StatelessWidget {
  final Color color;
  final Widget child;
  const AppButtonDecoration({
    super.key,
    this.color = AppPallete.accentColor1,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
              color: AppTheme.getPrimaryTextColor(context), width: 3),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 0,
                color: AppTheme.getPrimaryTextColor(context),
                offset: const Offset(0, 4))
          ]),
      child: child,
    );
  }
}
