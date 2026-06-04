import 'package:flutter/material.dart';

import '../../models/wellness_goal_model.dart';

class WeeklyGoalRow extends StatelessWidget {
  const WeeklyGoalRow({super.key, required this.goal});

  final WellnessGoalModel goal;

  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _darkText = Color(0xFF17201D);
  static const Color _mutedText = Color(0xFF6B7A74);
  static const Color _softGreen = Color(0xFFE8F8F3);
  static const Color _softBorder = Color(0xFFE6F0EC);

  static const double goalColumnWidth = 200;
  static const double rateColumnWidth = 48;
  static const double minimumTableWidth = 560;

  @override
  Widget build(BuildContext context) {
    final progress = goal.weeklyProgress;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFEFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _softBorder),
      ),
      child: Row(
        children: [
          SizedBox(
            width: goalColumnWidth,
            child: Row(
              children: [
                _GoalIconBadge(iconKey: goal.iconKey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    goal.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: _darkText,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              children: [
                for (var index = 0; index < 7; index++)
                  Expanded(
                    child: Center(
                      child: _WeeklyDayDot(
                        value: index < progress.length ? progress[index] : 0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: rateColumnWidth,
            child: Text(
              '${(goal.completionRate * 100).round()}%',
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: _mutedText,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeeklyDayDot extends StatelessWidget {
  const _WeeklyDayDot({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    final normalizedValue = value.clamp(0, 1).toDouble();

    return Tooltip(
      message: '${(normalizedValue * 100).round()}%',
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: normalizedValue >= 0.95
              ? WeeklyGoalRow._primaryGreen
              : WeeklyGoalRow._softGreen,
          borderRadius: BorderRadius.circular(99),
          border: Border.all(
            color: normalizedValue >= 0.95
                ? WeeklyGoalRow._primaryGreen
                : const Color(0xFFD5E9E2),
          ),
        ),
        child: normalizedValue >= 0.95
            ? const Icon(Icons.check_rounded, size: 12, color: Colors.white)
            : Center(
                child: Container(
                  width: 6 + normalizedValue * 6,
                  height: 6 + normalizedValue * 6,
                  decoration: BoxDecoration(
                    color: WeeklyGoalRow._primaryGreen.withValues(alpha: 0.70),
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ),
      ),
    );
  }
}

class _GoalIconBadge extends StatelessWidget {
  const _GoalIconBadge({required this.iconKey});

  final String iconKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: WeeklyGoalRow._softGreen,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Icon(
        _resolveIcon(iconKey),
        size: 16,
        color: WeeklyGoalRow._primaryGreen,
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
        return Icons.flag_outlined;
    }
  }
}
