import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_text_styles.dart';
import '../models/checkup_item.dart';
import 'dashboard_card.dart';

class CheckupTimelineCard extends StatelessWidget {
  const CheckupTimelineCard({required this.items, super.key});

  final List<CheckupItem> items;

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      title: 'Checkup Timeline',
      subtitle: 'Care schedule snapshot',
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (var index = 0; index < items.length; index++) ...[
              _TimelineTile(item: items[index]),
              if (index != items.length - 1)
                const SizedBox(height: AppSpacing.sm),
            ],
          ],
        ),
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  const _TimelineTile({required this.item});

  final CheckupItem item;

  @override
  Widget build(BuildContext context) {
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
              const _TimelineDot(),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  item.title,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Align(
            alignment: Alignment.centerLeft,
            child: _StatusBadge(status: item.status),
          ),
        ],
      ),
    );
  }
}

class _TimelineDot extends StatelessWidget {
  const _TimelineDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 0, maxWidth: 86),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: _statusBackground(status),
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            status,
            style: AppTextStyles.label.copyWith(
              color: _statusColor(status),
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  Color _statusBackground(String status) {
    switch (status) {
      case 'Upcoming':
        return const Color(0x1F14B8A6);
      case 'Scheduled':
        return const Color(0x1F2563EB);
      case 'Completed':
        return const Color(0x1F22C55E);
      case 'Planned':
        return const Color(0x1FF59E0B);
      default:
        return AppColors.background;
    }
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Upcoming':
        return AppColors.primary;
      case 'Scheduled':
        return AppColors.secondary;
      case 'Completed':
        return AppColors.success;
      case 'Planned':
        return AppColors.warning;
      default:
        return AppColors.textSecondary;
    }
  }
}


