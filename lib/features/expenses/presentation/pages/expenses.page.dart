import 'package:flutter/material.dart';
import 'package:spendify/core/layout/page.layout.dart';

class ExpensesPage extends StatelessWidget implements AppPage {
  @override
  IconData get pageIcon => Icons.money_outlined;

  @override
  String get pageTitle => "Expenses";

  const ExpensesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(pageTitle),
    );
  }
}
