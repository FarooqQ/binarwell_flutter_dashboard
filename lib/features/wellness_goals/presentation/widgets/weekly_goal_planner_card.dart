import 'package:flutter/material.dart';

import '../../data/wellness_goals_mock_data.dart';
import 'weekly_goal_row.dart';

class WeeklyGoalPlannerCard extends StatelessWidget {
  const WeeklyGoalPlannerCard({super.key});

  static const Color _darkText = Color(0xFF17201D);
  static const Color _mutedText = Color(0xFF6B7A74);
  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _softBorder = Color(0xFFE6F0EC);

  @override
  Widget build(BuildContext context) {
    final goals = WellnessGoalsMockData.todayGoals;

    return Container(
      constraints: const BoxConstraints(minHeight: 230),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _softBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _PlannerHeader(),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final tableWidth =
                  constraints.maxWidth < WeeklyGoalRow.minimumTableWidth
                  ? WeeklyGoalRow.minimumTableWidth
                  : constraints.maxWidth;

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: tableWidth,
                  child: Column(
                    children: [
                      const _PlannerTableHeader(),
                      const SizedBox(height: 8),
                      for (var index = 0; index < goals.length; index++) ...[
                        WeeklyGoalRow(goal: goals[index]),
                        if (index != goals.length - 1)
                          const SizedBox(height: 8),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PlannerHeader extends StatelessWidget {
  const _PlannerHeader();

  static const Color _darkText = WeeklyGoalPlannerCard._darkText;
  static const Color _mutedText = WeeklyGoalPlannerCard._mutedText;
  static const Color _primaryGreen = WeeklyGoalPlannerCard._primaryGreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _HeaderIcon(),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Weekly Goal Planner',
                key: const Key('weekly-goal-planner-title'),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _darkText,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Review goal consistency across the week.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: _mutedText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: _primaryGreen,
            visualDensity: VisualDensity.compact,
          ),
          child: const Text('This week'),
        ),
      ],
    );
  }
}

class _PlannerTableHeader extends StatelessWidget {
  const _PlannerTableHeader();

  static const List<String> _days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: WeeklyGoalRow.goalColumnWidth,
          child: Text(
            'Goal',
            maxLines: 1,
            softWrap: false,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: const Color(0xFF6B7A74),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            children: [
              for (final day in _days)
                Expanded(
                  child: Text(
                    day,
                    maxLines: 1,
                    softWrap: false,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: const Color(0xFF8A9A94),
                      fontWeight: FontWeight.w900,
                      height: 1,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: WeeklyGoalRow.rateColumnWidth,
          child: Text(
            'Rate',
            maxLines: 1,
            softWrap: false,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: const Color(0xFF8A9A94),
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8F3),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Icon(
        Icons.calendar_month_outlined,
        size: 20,
        color: Color(0xFF13A889),
      ),
    );
  }
}

