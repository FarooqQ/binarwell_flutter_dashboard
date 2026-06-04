import 'package:flutter/material.dart';

import '../models/activity_summary.dart';
import '../models/checkup_item.dart';
import '../models/vital_metric.dart';
import '../models/wellness_goal.dart';

abstract final class MockBinarWellData {
  static const ActivitySummary activitySummary = ActivitySummary(
    scorePercent: 82,
    energyLevel: 'Good',
    hydrationPercent: 68,
    recoveryPercent: 74,
    stepsToday: '6,420',
    sleepQuality: '7.5 h',
    weeklyMovement: [
      WeeklyMovementItem(day: 'Mon', steps: 4200),
      WeeklyMovementItem(day: 'Tue', steps: 5800),
      WeeklyMovementItem(day: 'Wed', steps: 6100),
      WeeklyMovementItem(day: 'Thu', steps: 3900),
      WeeklyMovementItem(day: 'Fri', steps: 7200),
      WeeklyMovementItem(day: 'Sat', steps: 6500),
      WeeklyMovementItem(day: 'Sun', steps: 5400),
    ],
    bodyBalance: [
      BodyBalanceItem(label: 'Hydration', percent: 68),
      BodyBalanceItem(label: 'Recovery', percent: 74),
      BodyBalanceItem(label: 'Body Energy', percent: 81),
      BodyBalanceItem(label: 'Sleep Balance', percent: 76),
    ],
  );

  static const List<WellnessGoal> dailyGoals = [
    WellnessGoal(
      title: 'Drink 2L Water',
      progress: 0.68,
      status: 'In Progress',
      icon: Icons.water_drop_rounded,
    ),
    WellnessGoal(
      title: 'Walk 6,000 Steps',
      progress: 1.0,
      status: 'Done',
      icon: Icons.directions_walk_rounded,
    ),
    WellnessGoal(
      title: 'Sleep before 11 PM',
      progress: 0.35,
      status: 'Pending',
      icon: Icons.bedtime_rounded,
    ),
    WellnessGoal(
      title: '10 min breathing session',
      progress: 0.5,
      status: 'In Progress',
      icon: Icons.self_improvement_rounded,
    ),
  ];

  static const List<CheckupItem> checkups = [
    CheckupItem(title: 'Nutrition Review', status: 'Upcoming'),
    CheckupItem(title: 'Blood Test', status: 'Scheduled'),
    CheckupItem(title: 'Eye Check', status: 'Completed'),
    CheckupItem(title: 'Fitness Assessment', status: 'Planned'),
  ];

  static const List<VitalMetric> vitalMetrics = [
    VitalMetric(
      label: 'Heart Rate',
      value: '72 bpm',
      icon: Icons.favorite_rounded,
    ),
    VitalMetric(
      label: 'Blood Pressure',
      value: '118/76',
      icon: Icons.bloodtype_rounded,
    ),
    VitalMetric(label: 'Oxygen Level', value: '97%', icon: Icons.air_rounded),
    VitalMetric(label: 'Stress Index', value: 'Low', icon: Icons.spa_rounded),
  ];
}


