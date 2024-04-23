import 'package:flutter/material.dart';
import 'package:spendify/core/layout/page.layout.dart';

class CategoriesPage extends StatelessWidget implements AppPage {
  @override
  IconData get pageIcon => Icons.category_outlined;

  @override
  String get pageTitle => "Categories";

  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(pageTitle),
    );
  }
}
