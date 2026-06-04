import 'package:flutter/material.dart';

//import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../activity/presentation/activity_page.dart';
import '../../checkups/presentation/checkups_page.dart';
import '../../nutrition/presentation/nutrition_page.dart';
import '../../reports/presentation/reports_page.dart';
import '../../settings/presentation/settings_page.dart';
import '../../wellness_goals/presentation/wellness_goals_page.dart';
import '../navigation/carepulse_page.dart';
import 'dashboard_content_grid.dart';
import 'dashboard_header.dart';

class DashboardMainArea extends StatelessWidget {
  const DashboardMainArea({
    super.key,
    this.selectedPage = CarePulsePage.overview,
  });

  final CarePulsePage selectedPage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 760;
        final isWellnessGoals = selectedPage == CarePulsePage.wellnessGoals;

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
              if (selectedPage == CarePulsePage.overview) ...[
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

  final CarePulsePage selectedPage;

  @override
  Widget build(BuildContext context) {
    switch (selectedPage) {
      case CarePulsePage.overview:
        return const DashboardContentGrid();

      case CarePulsePage.activity:
        return const ActivityPage();

      case CarePulsePage.wellnessGoals:
        return const WellnessGoalsPage();

      case CarePulsePage.checkups:
        return const CheckupsPage();

      case CarePulsePage.nutrition:
        return const NutritionPage();

      case CarePulsePage.reports:
        return const ReportsPage();

      case CarePulsePage.settings:
        return const SettingsPage();
    }
  }
}
