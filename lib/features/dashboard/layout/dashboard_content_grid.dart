import 'package:flutter/material.dart';

import '../../../app/theme/app_spacing.dart';
import '../data/mock_carepulse_data.dart';
import '../widgets/body_balance_card.dart';
import '../widgets/checkup_timeline_card.dart';
import '../widgets/daily_goals_card.dart';
import '../widgets/summary_metric_card.dart';
import '../widgets/vital_metrics_card.dart';
import '../widgets/weekly_movement_card.dart';
import '../widgets/wellness_score_card.dart';

class DashboardContentGrid extends StatelessWidget {
  const DashboardContentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final activitySummary = MockCarePulseData.activitySummary;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 760;

        if (isCompact) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 240,
                  child: WellnessScoreCard(
                    scorePercent: activitySummary.scorePercent,
                    energyLevel: activitySummary.energyLevel,
                    hydrationPercent: activitySummary.hydrationPercent,
                    recoveryPercent: activitySummary.recoveryPercent,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                SizedBox(
                  height: 220,
                  child: SummaryMetricCard(
                    title: 'Steps Today',
                    subtitle: 'Today movement',
                    value: activitySummary.stepsToday,
                    unitLabel: 'steps',
                    icon: Icons.directions_walk_rounded,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                SizedBox(
                  height: 220,
                  child: SummaryMetricCard(
                    title: 'Sleep Quality',
                    subtitle: 'Last night recovery',
                    value: activitySummary.sleepQuality,
                    unitLabel: 'sleep duration',
                    icon: Icons.bedtime_rounded,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                SizedBox(
                  height: 260,
                  child: WeeklyMovementCard(
                    items: activitySummary.weeklyMovement,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                const SizedBox(
                  height: 300,
                  child: DailyGoalsCard(goals: MockCarePulseData.dailyGoals),
                ),
                const SizedBox(height: AppSpacing.md),
                const SizedBox(
                  height: 300,
                  child: CheckupTimelineCard(items: MockCarePulseData.checkups),
                ),
                const SizedBox(height: AppSpacing.md),
                const SizedBox(
                  height: 300,
                  child: VitalMetricsCard(
                    metrics: MockCarePulseData.vitalMetrics,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                SizedBox(
                  height: 300,
                  child: BodyBalanceCard(items: activitySummary.bodyBalance),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DashboardGridRow(
                height: 220,
                children: [
                  _DashboardGridItem(
                    flex: 2,
                    child: WellnessScoreCard(
                      scorePercent: activitySummary.scorePercent,
                      energyLevel: activitySummary.energyLevel,
                      hydrationPercent: activitySummary.hydrationPercent,
                      recoveryPercent: activitySummary.recoveryPercent,
                    ),
                  ),
                  _DashboardGridItem(
                    child: SummaryMetricCard(
                      title: 'Steps Today',
                      subtitle: 'Today movement',
                      value: activitySummary.stepsToday,
                      unitLabel: 'steps',
                      icon: Icons.directions_walk_rounded,
                    ),
                  ),
                  _DashboardGridItem(
                    child: SummaryMetricCard(
                      title: 'Sleep Quality',
                      subtitle: 'Last night recovery',
                      value: activitySummary.sleepQuality,
                      unitLabel: 'sleep duration',
                      icon: Icons.bedtime_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              _DashboardGridRow(
                height: 300,
                children: [
                  _DashboardGridItem(
                    child: WeeklyMovementCard(
                      items: activitySummary.weeklyMovement,
                    ),
                  ),
                  const _DashboardGridItem(
                    child: DailyGoalsCard(goals: MockCarePulseData.dailyGoals),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              _DashboardGridRow(
                height: 300,
                children: [
                  const _DashboardGridItem(
                    child: CheckupTimelineCard(
                      items: MockCarePulseData.checkups,
                    ),
                  ),
                  const _DashboardGridItem(
                    child: VitalMetricsCard(
                      metrics: MockCarePulseData.vitalMetrics,
                    ),
                  ),
                  _DashboardGridItem(
                    child: BodyBalanceCard(items: activitySummary.bodyBalance),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DashboardGridRow extends StatelessWidget {
  const _DashboardGridRow({required this.height, required this.children});

  final double height;
  final List<_DashboardGridItem> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          for (var index = 0; index < children.length; index++) ...[
            Expanded(flex: children[index].flex, child: children[index].child),
            if (index != children.length - 1)
              const SizedBox(width: AppSpacing.md),
          ],
        ],
      ),
    );
  }
}

class _DashboardGridItem {
  const _DashboardGridItem({required this.child, this.flex = 1});

  final Widget child;
  final int flex;
}
