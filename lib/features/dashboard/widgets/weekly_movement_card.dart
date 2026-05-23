import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_text_styles.dart';
import '../models/activity_summary.dart';
import 'dashboard_card.dart';

class WeeklyMovementCard extends StatelessWidget {
  const WeeklyMovementCard({required this.items, super.key});

  final List<WeeklyMovementItem> items;

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      title: 'Weekly Movement',
      subtitle: 'Steps trend for this week',
      child: _WeeklyMovementChart(items: items),
    );
  }
}

class _WeeklyMovementChart extends StatelessWidget {
  const _WeeklyMovementChart({required this.items});

  final List<WeeklyMovementItem> items;

  @override
  Widget build(BuildContext context) {
    final maxSteps = items
        .map((item) => item.steps)
        .fold<int>(
          0,
          (previous, current) => current > previous ? current : previous,
        );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (final item in items) ...[
          Expanded(
            child: _MovementBar(
              item: item,
              maxSteps: maxSteps == 0 ? 1 : maxSteps,
            ),
          ),
          if (item != items.last) const SizedBox(width: AppSpacing.sm),
        ],
      ],
    );
  }
}

class _MovementBar extends StatelessWidget {
  const _MovementBar({required this.item, required this.maxSteps});

  final WeeklyMovementItem item;
  final int maxSteps;

  @override
  Widget build(BuildContext context) {
    final heightFactor = (item.steps / maxSteps).clamp(0.12, 1.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: heightFactor,
              widthFactor: 0.75,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppRadius.medium),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          item.day,
          style: AppTextStyles.label.copyWith(color: AppColors.textSecondary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
