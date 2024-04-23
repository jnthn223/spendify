import 'package:flutter/material.dart';
import 'package:spendify/core/theme/app_pallete.dart';
import 'package:spendify/core/theme/theme.dart';

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
          title: Text(activePage.pageTitle), // Use the state variable for title
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.person),
            )
          ],

          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(2.0), // Adjust height as needed
            child: Divider(
              thickness: 2.0, // Adjust thickness as needed
              color: Colors.black, // Customize border color
            ),
          ),
        ),
        body: activePage.build(context),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 2.0)),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            selectedItemColor: AppPallete.accentColor1,
            unselectedItemColor: AppTheme.getPrimaryTextColor(context),
            showSelectedLabels: true,
            showUnselectedLabels: true,
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
        ));
  }
}
