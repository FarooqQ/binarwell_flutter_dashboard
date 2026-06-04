import 'package:flutter/material.dart';

import '../../data/wellness_goals_mock_data.dart';
import 'goal_focus_item.dart';

class GoalFocusCard extends StatelessWidget {
  const GoalFocusCard({super.key});

  static const Color _darkText = Color(0xFF17201D);
  static const Color _mutedText = Color(0xFF6B7A74);
  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _softBorder = Color(0xFFE6F0EC);

  @override
  Widget build(BuildContext context) {
    final focusGoals = WellnessGoalsMockData.focusGoals;

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
          const _FocusHeader(),
          const SizedBox(height: 12),
          for (var index = 0; index < focusGoals.length; index++) ...[
            GoalFocusItem(goal: focusGoals[index]),
            if (index != focusGoals.length - 1) const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _FocusHeader extends StatelessWidget {
  const _FocusHeader();

  static const Color _darkText = GoalFocusCard._darkText;
  static const Color _mutedText = GoalFocusCard._mutedText;
  static const Color _primaryGreen = GoalFocusCard._primaryGreen;

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
                'Goal Focus of the Week',
                key: const Key('goal-focus-of-the-week-title'),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _darkText,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Prioritize the habits that matter most.',
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
          child: const Text('See focus'),
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
      child: const Icon(Icons.track_changes_rounded, color: Color(0xFF13A889)),
    );
  }
}


