import '../models/activity_goal_model.dart';
import '../models/activity_insight_model.dart';
import '../models/activity_session_model.dart';
import '../models/hourly_movement_model.dart';
import '../models/intensity_zone_model.dart';

abstract final class ActivityMockData {
  static const int steps = 6420;
  static const int targetSteps = 8000;
  static const double progress = 0.8;

  static const String progressLabel = '80%';
  static const String distance = '4.25 km';
  static const String activeTime = '38 min';
  static const String calories = '240 kcal';
  static const int remainingSteps = 1580;

  static const String statusMessage = "You are on track for today's goal";

  static const List<ActivityGoalModel> goals = [
    ActivityGoalModel(
      label: 'Walk 8,000 Steps',
      currentValue: '6,420',
      targetValue: '8,000 steps',
      progress: 0.8,
      iconKey: 'steps',
    ),
    ActivityGoalModel(
      label: 'Active for 45 Minutes',
      currentValue: '38',
      targetValue: '45 min',
      progress: 0.84,
      iconKey: 'active_time',
    ),
    ActivityGoalModel(
      label: 'Walk 5 KM',
      currentValue: '4.25',
      targetValue: '5 km',
      progress: 0.85,
      iconKey: 'distance',
    ),
    ActivityGoalModel(
      label: 'Burn 300 Calories',
      currentValue: '240',
      targetValue: '300 kcal',
      progress: 0.8,
      iconKey: 'calories',
    ),
  ];

  static const List<HourlyMovementModel> hourlyMovement = [
    HourlyMovementModel(hourLabel: '12 AM', steps: 120),
    HourlyMovementModel(hourLabel: '3 AM', steps: 40),
    HourlyMovementModel(hourLabel: '6 AM', steps: 260),
    HourlyMovementModel(hourLabel: '9 AM', steps: 940),
    HourlyMovementModel(hourLabel: '12 PM', steps: 1420),
    HourlyMovementModel(hourLabel: '3 PM', steps: 1180),
    HourlyMovementModel(hourLabel: '6 PM', steps: 1650),
    HourlyMovementModel(hourLabel: '9 PM', steps: 810),
    HourlyMovementModel(hourLabel: '12 AM', steps: 0),
  ];

  static const List<ActivitySessionModel> sessions = [
    ActivitySessionModel(
      title: 'Morning Walk',
      time: '7:30 AM',
      intensity: 'Moderate',
      primaryMetric: '2.45 km',
      secondaryMetric: '32 min',
      calories: '215 kcal',
    ),
    ActivitySessionModel(
      title: 'Lunch Break Walk',
      time: '12:30 PM',
      intensity: 'Light',
      primaryMetric: '1.25 km',
      secondaryMetric: '15 min',
      calories: '85 kcal',
    ),
    ActivitySessionModel(
      title: 'Evening Stretch',
      time: '7:30 PM',
      intensity: 'Light',
      primaryMetric: '8 min',
      secondaryMetric: 'Light Activity',
      calories: '40 kcal',
    ),
  ];

  static const List<IntensityZoneModel> intensityZones = [
    IntensityZoneModel(label: 'Light', minutes: 17, percentage: 0.45),
    IntensityZoneModel(label: 'Moderate', minutes: 13, percentage: 0.35),
    IntensityZoneModel(label: 'High', minutes: 8, percentage: 0.2),
  ];

  static const List<ActivityInsightModel> insights = [
    ActivityInsightModel(
      title: 'Best Active Hour',
      value: '12 PM - 1 PM',
      description: 'Your highest movement period today.',
      iconKey: 'best_hour',
    ),
    ActivityInsightModel(
      title: 'Weekly Average',
      value: '6,215 steps',
      description: 'Your average daily movement this week.',
      iconKey: 'weekly_average',
    ),
    ActivityInsightModel(
      title: 'Goal Achievement',
      value: '87%',
      description: 'Your current weekly goal completion rate.',
      iconKey: 'goal_achievement',
    ),
  ];
}


