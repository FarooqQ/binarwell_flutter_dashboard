import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_text_styles.dart';
import '../models/wellness_goal.dart';
import 'dashboard_card.dart';

class DailyGoalsCard extends StatelessWidget {
  const DailyGoalsCard({required this.goals, super.key});

  final List<WellnessGoal> goals;

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      title: 'Daily Goals',
      subtitle: 'Today wellness checklist',
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (var index = 0; index < goals.length; index++) ...[
              _DailyGoalTile(goal: goals[index]),
              if (index != goals.length - 1)
                const SizedBox(height: AppSpacing.sm),
            ],
          ],
        ),
      ),
    );
  }
}

class _DailyGoalTile extends StatelessWidget {
  const _DailyGoalTile({required this.goal});

  final WellnessGoal goal;

  @override
  Widget build(BuildContext context) {
    final progressValue = goal.progress.clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppRadius.large),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.medium),
                  border: Border.all(color: AppColors.border),
                ),
                child: Icon(goal.icon, size: 17, color: AppColors.primary),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  goal.title,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 82),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    goal.status,
                    style: AppTextStyles.label.copyWith(
                      color: _statusColor(goal.status),
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: LinearProgressIndicator(
              value: progressValue,
              minHeight: 5,
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

  Color _statusColor(String status) {
    switch (status) {
      case 'Done':
        return AppColors.success;
      case 'In Progress':
        return AppColors.primary;
      case 'Pending':
        return AppColors.warning;
      default:
        return AppColors.textSecondary;
    }
  }
}
