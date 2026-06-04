import 'package:flutter/material.dart';

//import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../activity/presentation/activity_page.dart';
import '../../checkups/presentation/checkups_page.dart';
import '../../nutrition/presentation/nutrition_page.dart';
import '../../reports/presentation/reports_page.dart';
import '../../settings/presentation/settings_page.dart';
import '../../wellness_goals/presentation/wellness_goals_page.dart';
import '../navigation/binarwell_page.dart';
import 'dashboard_content_grid.dart';
import 'dashboard_header.dart';

class DashboardMainArea extends StatelessWidget {
  const DashboardMainArea({
    super.key,
    this.selectedPage = BinarWellPage.overview,
  });

  final BinarWellPage selectedPage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 760;
        final isWellnessGoals = selectedPage == BinarWellPage.wellnessGoals;

        final pageBackground = const Color(0xFFF6FAF9);

        final leftPadding = isWellnessGoals ? 4.0 : AppSpacing.md;

        final rightPadding = isWellnessGoals
            ? 4.0
            : isCompact
            ? AppSpacing.md
            : AppSpacing.xl;

        final headerGap = isCompact ? AppSpacing.md : AppSpacing.lg;

        return Container(
          color: pageBackground,
          padding: EdgeInsets.fromLTRB(
            leftPadding,
            AppSpacing.md,
            rightPadding,
            AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (selectedPage == BinarWellPage.overview) ...[
                const DashboardHeader(),
                SizedBox(height: headerGap),
              ],
              Expanded(
                child: _DashboardPageContent(selectedPage: selectedPage),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DashboardPageContent extends StatelessWidget {
  const _DashboardPageContent({required this.selectedPage});

  final BinarWellPage selectedPage;

  @override
  Widget build(BuildContext context) {
    switch (selectedPage) {
      case BinarWellPage.overview:
        return const DashboardContentGrid();

      case BinarWellPage.activity:
        return const ActivityPage();

      case BinarWellPage.wellnessGoals:
        return const WellnessGoalsPage();

      case BinarWellPage.checkups:
        return const CheckupsPage();

      case BinarWellPage.nutrition:
        return const NutritionPage();

      case BinarWellPage.reports:
        return const ReportsPage();

      case BinarWellPage.settings:
        return const SettingsPage();
    }
  }
}


