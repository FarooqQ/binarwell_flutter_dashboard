import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_text_styles.dart';
import '../models/activity_summary.dart';
import 'dashboard_card.dart';

class BodyBalanceCard extends StatelessWidget {
  const BodyBalanceCard({required this.items, super.key});

  final List<BodyBalanceItem> items;

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      title: 'Body Balance',
      subtitle: 'Energy and recovery view',
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (var index = 0; index < items.length; index++) ...[
              _BodyBalanceProgressItem(item: items[index]),
              if (index != items.length - 1)
                const SizedBox(height: AppSpacing.sm),
            ],
          ],
        ),
      ),
    );
  }
}

class _BodyBalanceProgressItem extends StatelessWidget {
  const _BodyBalanceProgressItem({required this.item});

  final BodyBalanceItem item;

  @override
  Widget build(BuildContext context) {
    final progressValue = item.percent.clamp(0, 100) / 100;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppRadius.large),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item.label,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                '${item.percent}%',
                style: AppTextStyles.label.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: LinearProgressIndicator(
              value: progressValue,
              minHeight: 7,
              backgroundColor: AppColors.surface,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


