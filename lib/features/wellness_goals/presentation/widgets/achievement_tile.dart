import 'package:flutter/material.dart';

import '../../models/goal_achievement_model.dart';

class AchievementTile extends StatelessWidget {
  const AchievementTile({super.key, required this.achievement});

  final GoalAchievementModel achievement;

  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _darkText = Color(0xFF17201D);
  static const Color _mutedText = Color(0xFF6B7A74);
  static const Color _softGreen = Color(0xFFE8F8F3);
  static const Color _softBorder = Color(0xFFE6F0EC);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFEFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _softBorder),
      ),
      child: Row(
        children: [
          _AchievementIconBadge(iconKey: achievement.iconKey),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _darkText,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  achievement.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: _mutedText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(
              color: _softGreen,
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              achievement.badgeLabel,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: _primaryGreen,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AchievementIconBadge extends StatelessWidget {
  const _AchievementIconBadge({required this.iconKey});

  final String iconKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: AchievementTile._softGreen,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(
        _resolveIcon(iconKey),
        size: 18,
        color: AchievementTile._primaryGreen,
      ),
    );
  }

  IconData _resolveIcon(String key) {
    switch (key) {
      case 'flame':
        return Icons.local_fire_department_outlined;
      case 'water':
        return Icons.water_drop_outlined;
      case 'leaf':
        return Icons.spa_outlined;
      case 'trophy':
        return Icons.emoji_events_outlined;
      default:
        return Icons.workspace_premium_outlined;
    }
  }
}

