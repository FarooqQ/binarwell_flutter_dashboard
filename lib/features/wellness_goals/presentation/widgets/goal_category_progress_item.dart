import 'package:flutter/material.dart';

import '../../models/goal_category_model.dart';

class GoalCategoryProgressItem extends StatelessWidget {
  const GoalCategoryProgressItem({super.key, required this.category});

  final GoalCategoryModel category;

  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _darkText = Color(0xFF17201D);
  static const Color _mutedText = Color(0xFF6B7A74);
  static const Color _softGreen = Color(0xFFE8F8F3);
  static const Color _softBorder = Color(0xFFE6F0EC);

  @override
  Widget build(BuildContext context) {
    final progressValue = category.completionRate.clamp(0, 1).toDouble();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFEFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _softBorder),
      ),
      child: Row(
        children: [
          _CategoryIconBadge(iconKey: category.iconKey),
          const SizedBox(width: 10),
          SizedBox(
            width: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _darkText,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  category.goalsLabel,
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
          const SizedBox(width: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: LinearProgressIndicator(
                minHeight: 7,
                value: progressValue,
                backgroundColor: const Color(0xFFEAF2EF),
                valueColor: const AlwaysStoppedAnimation<Color>(_primaryGreen),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 40,
            child: Text(
              category.percentageLabel,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
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

class _CategoryIconBadge extends StatelessWidget {
  const _CategoryIconBadge({required this.iconKey});

  final String iconKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: GoalCategoryProgressItem._softGreen,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(
        _resolveIcon(iconKey),
        size: 18,
        color: GoalCategoryProgressItem._primaryGreen,
      ),
    );
  }

  IconData _resolveIcon(String key) {
    switch (key) {
      case 'water':
        return Icons.water_drop_outlined;
      case 'moon':
        return Icons.nightlight_round;
      case 'meal':
        return Icons.restaurant_menu_rounded;
      case 'leaf':
        return Icons.spa_outlined;
      case 'walk':
        return Icons.directions_walk_rounded;
      default:
        return Icons.category_outlined;
    }
  }
}
