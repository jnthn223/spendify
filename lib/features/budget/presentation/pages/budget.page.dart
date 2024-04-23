import 'package:flutter/material.dart';
import 'package:spendify/core/layout/page.layout.dart';

class BudgetPage extends StatelessWidget implements AppPage {
  @override
  IconData get pageIcon => Icons.wallet_outlined;

  @override
  String get pageTitle => "Budget";

  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(pageTitle),
    );
  }
}
