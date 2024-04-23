import 'package:flutter/material.dart';

abstract class AppPage {
  String get pageTitle;
  IconData get pageIcon;

  Widget build(BuildContext context);
}

class PageLayout extends StatelessWidget {
  final List<AppPage> pages;
  final ValueSetter<AppPage> setActivePage;
  final AppPage activePage;
  const PageLayout({
    super.key,
    required this.pages,
    required this.setActivePage,
    required this.activePage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activePage.pageTitle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: pages
            .map((page) => BottomNavigationBarItem(
                  icon: Icon(page.pageIcon),
                  label: page.pageTitle,
                ))
            .toList(),
        currentIndex: pages.indexOf(activePage),
        onTap: (index) {
          setActivePage(pages[index]);
        },
      ),
    );
  }
}
