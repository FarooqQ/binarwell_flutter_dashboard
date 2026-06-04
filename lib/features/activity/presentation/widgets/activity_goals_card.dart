import 'package:flutter/material.dart';

import '../../data/activity_mock_data.dart';
import '../../models/activity_goal_model.dart';

class ActivityGoalsCard extends StatelessWidget {
  const ActivityGoalsCard({super.key});

  static const Color _primaryColor = Color(0xFF0BAE9A);
  static const Color _textColor = Color(0xFF0F172A);
  static const Color _mutedTextColor = Color(0xFF64748B);
  static const Color _borderColor = Color(0xFFE2E8F0);
  static const Color _softBackground = Color(0xFFE4F8F5);

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
        children: [
          _ActivityGoalsHeader(),
          SizedBox(height: 14),
          _ActivityGoalsList(),
        ],
      ),
    );
  }
}

class _ActivityGoalsHeader extends StatelessWidget {
  const _ActivityGoalsHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'Activity Goals',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ActivityGoalsCard._textColor,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(width: 12),
        _GoalsBadge(),
      ],
    );
  }
}

class _GoalsBadge extends StatelessWidget {
  const _GoalsBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ActivityGoalsCard._softBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        '4 Goals',
        style: TextStyle(
          color: ActivityGoalsCard._primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _ActivityGoalsList extends StatelessWidget {
  const _ActivityGoalsList();

  @override
  Widget build(BuildContext context) {
    final goals = ActivityMockData.goals;

    return Column(
      children: [
        for (var index = 0; index < goals.length; index++) ...[
          _ActivityGoalRow(goal: goals[index]),
          if (index != goals.length - 1) const SizedBox(height: 13),
        ],
      ],
    );
  }
}

class _ActivityGoalRow extends StatelessWidget {
  const _ActivityGoalRow({required this.goal});

  final ActivityGoalModel goal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _GoalIcon(icon: _resolveIcon(goal.iconKey)),
        const SizedBox(width: 12),
        Expanded(child: _GoalProgressContent(goal: goal)),
        const SizedBox(width: 12),
        _GoalValueColumn(goal: goal),
      ],
    );
  }

  IconData _resolveIcon(String iconKey) {
    switch (iconKey) {
      case 'steps':
        return Icons.directions_walk_rounded;
      case 'active_time':
        return Icons.timer_rounded;
      case 'distance':
        return Icons.location_on_rounded;
      case 'calories':
        return Icons.local_fire_department_rounded;
      default:
        return Icons.flag_rounded;
    }
  }
}

class _GoalIcon extends StatelessWidget {
  const _GoalIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: ActivityGoalsCard._softBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(icon, color: ActivityGoalsCard._primaryColor, size: 21),
    );
  }
}

class _GoalProgressContent extends StatelessWidget {
  const _GoalProgressContent({required this.goal});

  final ActivityGoalModel goal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          goal.label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: ActivityGoalsCard._textColor,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: LinearProgressIndicator(
            value: goal.progress,
            minHeight: 6,
            backgroundColor: const Color(0xFFE8EEF4),
            valueColor: const AlwaysStoppedAnimation<Color>(
              ActivityGoalsCard._primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

class _GoalValueColumn extends StatelessWidget {
  const _GoalValueColumn({required this.goal});

  final ActivityGoalModel goal;

  String get _displayValue {
    final target = goal.targetValue
        .replaceAll(' steps', '')
        .replaceAll(' kcal', ' kcal');

    return '${goal.currentValue} / $target';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 78,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${goal.percentage}%',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: ActivityGoalsCard._textColor,
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _displayValue,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: ActivityGoalsCard._mutedTextColor,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

