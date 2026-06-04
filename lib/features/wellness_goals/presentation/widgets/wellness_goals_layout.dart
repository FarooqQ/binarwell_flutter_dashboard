import 'package:flutter/material.dart';

import 'goal_categories_card.dart';
import 'goal_focus_card.dart';
import 'goal_summary_cards.dart';
import 'today_goal_checklist_card.dart';
import 'weekly_goal_planner_card.dart';
import 'recent_achievements_card.dart';
import 'wellness_insights_card.dart';

class WellnessGoalsLayout extends StatelessWidget {
  const WellnessGoalsLayout({super.key});

  static const double _gap = 12;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GoalSummaryCards(),
        SizedBox(height: _gap),
        _MainGoalsGrid(),
        SizedBox(height: _gap),
        _PlanningAndCategoriesRow(),
        SizedBox(height: _gap),
        _BottomInsightsRow(),
      ],
    );
  }
}

class _MainGoalsGrid extends StatelessWidget {
  const _MainGoalsGrid();

  static const double _desktopRowHeight = 410;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 900) {
          return const Column(
            children: [
              TodayGoalChecklistCard(),
              SizedBox(height: WellnessGoalsLayout._gap),
              GoalFocusCard(),
            ],
          );
        }

        return const SizedBox(
          height: _desktopRowHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 6, child: TodayGoalChecklistCard()),
              SizedBox(width: WellnessGoalsLayout._gap),
              Expanded(flex: 5, child: GoalFocusCard()),
            ],
          ),
        );
      },
    );
  }
}

class _PlanningAndCategoriesRow extends StatelessWidget {
  const _PlanningAndCategoriesRow();

  static const double _desktopRowHeight = 410;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 900) {
          return const Column(
            children: [
              WeeklyGoalPlannerCard(),
              SizedBox(height: WellnessGoalsLayout._gap),
              GoalCategoriesCard(),
            ],
          );
        }

        return const SizedBox(
          height: _desktopRowHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 6, child: WeeklyGoalPlannerCard()),
              SizedBox(width: WellnessGoalsLayout._gap),
              Expanded(flex: 5, child: GoalCategoriesCard()),
            ],
          ),
        );
      },
    );
  }
}

class _BottomInsightsRow extends StatelessWidget {
  const _BottomInsightsRow();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 900) {
          return const Column(
            children: [
              RecentAchievementsCard(),
              SizedBox(height: WellnessGoalsLayout._gap),
              WellnessInsightsCard(),
            ],
          );
        }

        return const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: RecentAchievementsCard()),
            SizedBox(width: WellnessGoalsLayout._gap),
            Expanded(child: WellnessInsightsCard()),
          ],
        );
      },
    );
  }
}


