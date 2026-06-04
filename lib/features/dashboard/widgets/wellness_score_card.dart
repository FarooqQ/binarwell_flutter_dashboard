import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_text_styles.dart';
import 'dashboard_card.dart';

class WellnessScoreCard extends StatelessWidget {
  const WellnessScoreCard({
    required this.scorePercent,
    required this.energyLevel,
    required this.hydrationPercent,
    required this.recoveryPercent,
    super.key,
  });

  final int scorePercent;
  final String energyLevel;
  final int hydrationPercent;
  final int recoveryPercent;

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      title: 'Wellness Score',
      subtitle: 'Overall balance snapshot',
      child: Row(
        children: [
          _ScoreProgress(scorePercent: scorePercent),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Overall Wellness Score',
                  style: AppTextStyles.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                _ScoreMetric(label: 'Energy Level', value: energyLevel),
                _ScoreMetric(label: 'Hydration', value: '$hydrationPercent%'),
                _ScoreMetric(label: 'Recovery', value: '$recoveryPercent%'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreProgress extends StatelessWidget {
  const _ScoreProgress({required this.scorePercent});

  final int scorePercent;

  @override
  Widget build(BuildContext context) {
    final progressValue = scorePercent.clamp(0, 100) / 100;

    return SizedBox(
      width: 64,
      height: 64,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(
              value: progressValue,
              strokeWidth: 7,
              backgroundColor: AppColors.background,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
          ),
          Text('$scorePercent%', style: AppTextStyles.title),
        ],
      ),
    );
  }
}

class _ScoreMetric extends StatelessWidget {
  const _ScoreMetric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.body,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          value,
          style: AppTextStyles.body.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

