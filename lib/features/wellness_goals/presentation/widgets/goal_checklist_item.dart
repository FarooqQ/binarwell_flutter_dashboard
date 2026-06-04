import 'package:flutter/material.dart';

import '../../models/wellness_goal_model.dart';

class GoalChecklistItem extends StatelessWidget {
  const GoalChecklistItem({super.key, required this.goal});

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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _softBorder),
      ),
      child: Row(
        children: [
          _GoalIconBadge(iconKey: goal.iconKey),
          const SizedBox(width: 10),
          Checkbox(
            value: goal.isCompleted,
            onChanged: (_) {},
            activeColor: _primaryGreen,
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  goal.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _darkText,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: LinearProgressIndicator(
                    minHeight: 7,
                    value: progressValue,
                    backgroundColor: const Color(0xFFEAF2EF),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      _primaryGreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          SizedBox(
            width: 78,
            child: Text(
              goal.progressLabel,
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: _mutedText,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFF8A9A94)),
        ],
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
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: GoalChecklistItem._softGreen,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(
        _resolveIcon(iconKey),
        size: 18,
        color: GoalChecklistItem._primaryGreen,
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


