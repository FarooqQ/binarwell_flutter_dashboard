import 'package:flutter/material.dart';

import '../../data/activity_mock_data.dart';
import '../../models/activity_insight_model.dart';

class ActivityInsightsCard extends StatelessWidget {
  const ActivityInsightsCard({super.key});

  static const Color _primaryColor = Color(0xFF0BAE9A);
  static const Color _textColor = Color(0xFF0F172A);
  static const Color _mutedTextColor = Color(0xFF64748B);
  static const Color _borderColor = Color(0xFFE2E8F0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: _borderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [_InsightsHeader(), SizedBox(height: 16), _InsightsList()],
      ),
    );
  }

  static Color softColorForIcon(String iconKey) {
    switch (iconKey) {
      case 'best_hour':
        return const Color(0xFFE4F8F5);
      case 'weekly_average':
        return const Color(0xFFEFF6FF);
      case 'goal_achievement':
        return const Color(0xFFF5EDFF);
      default:
        return const Color(0xFFF8FAFC);
    }
  }

  static Color iconColorForIcon(String iconKey) {
    switch (iconKey) {
      case 'best_hour':
        return _primaryColor;
      case 'weekly_average':
        return const Color(0xFF2563EB);
      case 'goal_achievement':
        return const Color(0xFF7C3AED);
      default:
        return _mutedTextColor;
    }
  }
}

class _InsightsHeader extends StatelessWidget {
  const _InsightsHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activity Insights',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: ActivityInsightsCard._textColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Key insights about your movement',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: ActivityInsightsCard._mutedTextColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _InsightsList extends StatelessWidget {
  const _InsightsList();

  @override
  Widget build(BuildContext context) {
    final insights = ActivityMockData.insights;

    return LayoutBuilder(
      builder: (context, constraints) {
        final canUseExpandedRow = constraints.maxWidth >= 500;

        if (canUseExpandedRow) {
          return Row(
            children: [
              for (var index = 0; index < insights.length; index++) ...[
                Expanded(child: _InsightTile(insight: insights[index])),
                if (index != insights.length - 1) const SizedBox(width: 14),
              ],
            ],
          );
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var index = 0; index < insights.length; index++) ...[
                SizedBox(
                  width: 210,
                  child: _InsightTile(insight: insights[index]),
                ),
                if (index != insights.length - 1) const SizedBox(width: 14),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _InsightTile extends StatelessWidget {
  const _InsightTile({required this.insight});

  final ActivityInsightModel insight;

  @override
  Widget build(BuildContext context) {
    final iconColor = ActivityInsightsCard.iconColorForIcon(insight.iconKey);

    return Container(
      height: 118,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ActivityInsightsCard.softColorForIcon(insight.iconKey),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          _InsightIcon(icon: _resolveIcon(insight.iconKey), color: iconColor),
          const SizedBox(width: 14),
          Expanded(
            child: _InsightContent(insight: insight, accentColor: iconColor),
          ),
        ],
      ),
    );
  }

  IconData _resolveIcon(String iconKey) {
    switch (iconKey) {
      case 'best_hour':
        return Icons.schedule_rounded;
      case 'weekly_average':
        return Icons.trending_up_rounded;
      case 'goal_achievement':
        return Icons.track_changes_rounded;
      default:
        return Icons.insights_rounded;
    }
  }
}

class _InsightContent extends StatelessWidget {
  const _InsightContent({required this.insight, required this.accentColor});

  final ActivityInsightModel insight;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          insight.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: ActivityInsightsCard._mutedTextColor,
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          insight.value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: ActivityInsightsCard._textColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          insight.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: accentColor,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _InsightIcon extends StatelessWidget {
  const _InsightIcon({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}


