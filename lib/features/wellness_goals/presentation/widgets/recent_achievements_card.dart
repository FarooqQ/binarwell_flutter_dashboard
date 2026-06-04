import 'package:flutter/material.dart';

import '../../data/wellness_goals_mock_data.dart';
import 'achievement_tile.dart';

class RecentAchievementsCard extends StatelessWidget {
  const RecentAchievementsCard({super.key});

  static const Color _darkText = Color(0xFF17201D);
  static const Color _mutedText = Color(0xFF6B7A74);
  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _softBorder = Color(0xFFE6F0EC);

  @override
  Widget build(BuildContext context) {
    final achievements = WellnessGoalsMockData.achievements;

    return Container(
      constraints: const BoxConstraints(minHeight: 190),
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
          const _AchievementsHeader(),
          const SizedBox(height: 12),
          for (var index = 0; index < achievements.length; index++) ...[
            AchievementTile(achievement: achievements[index]),
            if (index != achievements.length - 1) const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _AchievementsHeader extends StatelessWidget {
  const _AchievementsHeader();

  static const Color _darkText = RecentAchievementsCard._darkText;
  static const Color _mutedText = RecentAchievementsCard._mutedText;
  static const Color _primaryGreen = RecentAchievementsCard._primaryGreen;

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
                'Recent Achievements',
                key: const Key('recent-achievements-title'),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _darkText,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Small wins from your wellness progress.',
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
          child: const Text('View all'),
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
        Icons.emoji_events_outlined,
        size: 20,
        color: Color(0xFF13A889),
      ),
    );
  }
}


