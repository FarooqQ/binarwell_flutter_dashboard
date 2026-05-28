import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../navigation/carepulse_page.dart';
import 'dashboard_main_area.dart';
import 'wellness_sidebar.dart';

class DashboardShell extends StatefulWidget {
  const DashboardShell({super.key});

  static const double _overviewMinimumWidth = 980;
  static const double _activityMinimumWidth = 1180;

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  CarePulsePage _selectedPage = CarePulsePage.overview;

  void _handlePageSelected(CarePulsePage page) {
    setState(() {
      _selectedPage = page;
    });
  }

  double _minimumWidthForPage(CarePulsePage page) {
    switch (page) {
      case CarePulsePage.activity:
        return DashboardShell._activityMinimumWidth;

      case CarePulsePage.overview:
      case CarePulsePage.wellnessGoals:
      case CarePulsePage.checkups:
      case CarePulsePage.nutrition:
      case CarePulsePage.reports:
      case CarePulsePage.settings:
        return DashboardShell._overviewMinimumWidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final minimumWidth = _minimumWidthForPage(_selectedPage);

        final shellWidth = math.max(constraints.maxWidth, minimumWidth);

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: shellWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                WellnessSidebar(
                  selectedPage: _selectedPage,
                  onPageSelected: _handlePageSelected,
                ),
                Expanded(child: DashboardMainArea(selectedPage: _selectedPage)),
              ],
            ),
          ),
        );
      },
    );
  }
}
