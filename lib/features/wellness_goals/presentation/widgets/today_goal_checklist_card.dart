import 'package:flutter/material.dart';

import '../../data/wellness_goals_mock_data.dart';
import 'goal_checklist_item.dart';

class TodayGoalChecklistCard extends StatelessWidget {
  const TodayGoalChecklistCard({super.key});

  static const Color _darkText = Color(0xFF17201D);
  static const Color _mutedText = Color(0xFF6B7A74);
  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _softBorder = Color(0xFFE6F0EC);

  @override
  Widget build(BuildContext context) {
    final goals = WellnessGoalsMockData.todayGoals;

    return Container(
      constraints: const BoxConstraints(minHeight: 300),
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
          const _ChecklistHeader(),
          const SizedBox(height: 12),
          for (var index = 0; index < goals.length; index++) ...[
            GoalChecklistItem(goal: goals[index]),
            if (index != goals.length - 1) const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _ChecklistHeader extends StatelessWidget {
  const _ChecklistHeader();

  static const Color _darkText = TodayGoalChecklistCard._darkText;
  static const Color _mutedText = TodayGoalChecklistCard._mutedText;
  static const Color _primaryGreen = TodayGoalChecklistCard._primaryGreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _HeaderIcon(),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Todays Goal Checklist',
                key: const Key('todays-goal-checklist-title'),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _darkText,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Complete your daily wellness goals.',
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
          style: TextButton.styleFrom(foregroundColor: _primaryGreen),
          child: const Text('View goals'),
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
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Icon(
        Icons.playlist_add_check_circle_outlined,
        color: Color(0xFF13A889),
      ),
    );
  }
}
