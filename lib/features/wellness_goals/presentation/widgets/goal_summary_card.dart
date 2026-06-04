import 'package:flutter/material.dart';

import '../../models/goal_summary_model.dart';

class GoalSummaryCard extends StatelessWidget {
  const GoalSummaryCard({super.key, required this.summary});

  final GoalSummaryModel summary;

  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _darkText = Color(0xFF17201D);
  static const Color _mutedText = Color(0xFF6B7A74);
  static const Color _softBorder = Color(0xFFE6F0EC);

  @override
  Widget build(BuildContext context) {
    final progressValue = (summary.progressValue ?? 0).clamp(0, 1).toDouble();

    return Container(
      constraints: const BoxConstraints(minHeight: 150),
      padding: const EdgeInsets.all(20),
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
          _SummaryIconBadge(iconKey: summary.iconKey),
          const SizedBox(height: 18),
          Text(
            summary.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: _mutedText,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            summary.value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: _darkText,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            summary.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFF8A9A94),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              minHeight: 7,
              value: progressValue,
              backgroundColor: const Color(0xFFEAF2EF),
              valueColor: const AlwaysStoppedAnimation<Color>(_primaryGreen),
            ),
          ),
          if (summary.highlightText != null) ...[
            const SizedBox(height: 10),
            Text(
              summary.highlightText!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: _primaryGreen,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SummaryIconBadge extends StatelessWidget {
  const _SummaryIconBadge({required this.iconKey});

  final String iconKey;

  static const Color _primaryGreen = Color(0xFF13A889);
  static const Color _softGreen = Color(0xFFE8F8F3);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: _softGreen,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(_resolveIcon(iconKey), size: 22, color: _primaryGreen),
    );
  }

  IconData _resolveIcon(String key) {
    switch (key) {
      case 'check':
        return Icons.check_circle_outline_rounded;
      case 'flame':
        return Icons.local_fire_department_outlined;
      case 'target':
        return Icons.flag_outlined;
      case 'progress':
        return Icons.donut_large_rounded;
      default:
        return Icons.insights_outlined;
    }
  }
}

