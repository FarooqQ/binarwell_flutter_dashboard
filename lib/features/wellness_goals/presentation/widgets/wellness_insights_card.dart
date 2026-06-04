import 'package:flutter/material.dart';

import '../../data/wellness_goals_mock_data.dart';
import 'wellness_insight_tile.dart';

class WellnessInsightsCard extends StatelessWidget {
  const WellnessInsightsCard({super.key});

  static const Color _darkText = Color(0xFF17201D);
  static const Color _mutedText = Color(0xFF6B7A74);
  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _softBorder = Color(0xFFE6F0EC);

  @override
  Widget build(BuildContext context) {
    final insights = WellnessGoalsMockData.insights;

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
          const _InsightsHeader(),
          const SizedBox(height: 12),
          for (var index = 0; index < insights.length; index++) ...[
            WellnessInsightTile(insight: insights[index]),
            if (index != insights.length - 1) const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _InsightsHeader extends StatelessWidget {
  const _InsightsHeader();

  static const Color _darkText = WellnessInsightsCard._darkText;
  static const Color _mutedText = WellnessInsightsCard._mutedText;
  static const Color _primaryGreen = WellnessInsightsCard._primaryGreen;

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
                'Wellness Insights',
                key: const Key('wellness-insights-title'),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _darkText,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Short guidance for your next step.',
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
          child: const Text('Review'),
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
        Icons.insights_outlined,
        size: 20,
        color: Color(0xFF13A889),
      ),
    );
  }
}


