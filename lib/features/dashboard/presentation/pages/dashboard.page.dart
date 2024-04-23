import 'package:flutter/material.dart';
import 'package:spendify/core/layout/page.layout.dart';

class DashboardPage extends StatelessWidget implements AppPage {
  @override
  IconData get pageIcon => Icons.home_outlined;

  @override
  String get pageTitle => "Home";

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(pageTitle),
    );
  }
}
