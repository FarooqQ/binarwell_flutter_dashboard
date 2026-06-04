import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../navigation/binarwell_page.dart';
import 'dashboard_main_area.dart';
import 'wellness_sidebar.dart';

const Color _appCanvasBackground = Color(0xFFF6FAF9);

class DashboardShell extends StatefulWidget {
  const DashboardShell({super.key});

  static const double _overviewMinimumWidth = 980;
  static const double _activityMinimumWidth = 1180;
  static const double _wellnessGoalsMinimumWidth = 1180;

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  BinarWellPage _selectedPage = BinarWellPage.overview;

  void _handlePageSelected(BinarWellPage page) {
    setState(() {
      _selectedPage = page;
    });
  }

  double _minimumWidthForPage(BinarWellPage page) {
    switch (page) {
      case BinarWellPage.activity:
        return DashboardShell._activityMinimumWidth;

      case BinarWellPage.wellnessGoals:
        return DashboardShell._wellnessGoalsMinimumWidth;

      case BinarWellPage.overview:
      case BinarWellPage.checkups:
      case BinarWellPage.nutrition:
      case BinarWellPage.reports:
      case BinarWellPage.settings:
        return DashboardShell._overviewMinimumWidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final minimumWidth = _minimumWidthForPage(_selectedPage);
        final shellWidth = math.max(constraints.maxWidth, minimumWidth);

        return Container(
          color: _appCanvasBackground,
          child: SingleChildScrollView(
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
                  Expanded(
                    child: DashboardMainArea(selectedPage: _selectedPage),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


