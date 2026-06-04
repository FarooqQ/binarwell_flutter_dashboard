import 'package:flutter/material.dart';

import '../../models/wellness_goal_model.dart';

class GoalFocusItem extends StatelessWidget {
  const GoalFocusItem({super.key, required this.goal});

  final WellnessGoalModel goal;

  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _darkText = Color(0xFF17201D);
  static const Color _mutedText = Color(0xFF6B7A74);
  static const Color _softGreen = Color(0xFFE8F8F3);
  static const Color _softBorder = Color(0xFFE6F0EC);

  @override
  Widget build(BuildContext context) {
    final progressValue = goal.completionRate.clamp(0, 1).toDouble();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFEFC),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _softBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _FocusIconBadge(iconKey: goal.iconKey),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  goal.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _darkText,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              _StatusPill(goal: goal),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            goal.progressLabel,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: _mutedText,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              minHeight: 8,
              value: progressValue,
              backgroundColor: const Color(0xFFEAF2EF),
              valueColor: const AlwaysStoppedAnimation<Color>(_primaryGreen),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.goal});

  final WellnessGoalModel goal;

  @override
  Widget build(BuildContext context) {
    final label = goal.isCompleted ? 'Completed' : 'In Progress';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8F3),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: const Color(0xFF13A889),
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _FocusIconBadge extends StatelessWidget {
  const _FocusIconBadge({required this.iconKey});

  final String iconKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: GoalFocusItem._softGreen,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(
        _resolveIcon(iconKey),
        size: 18,
        color: GoalFocusItem._primaryGreen,
      ),
    );
  }

  IconData _resolveIcon(String key) {
    switch (key) {
      case 'water':
        return Icons.water_drop_outlined;
      case 'moon':
        return Icons.nightlight_round;
      case 'walk':
        return Icons.directions_walk_rounded;
      case 'leaf':
        return Icons.spa_outlined;
      case 'meal':
        return Icons.restaurant_menu_rounded;
      default:
        return Icons.track_changes_rounded;
    }
  }
}
