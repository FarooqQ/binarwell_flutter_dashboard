import 'wellness_goal_model.dart';

class GoalCategoryModel {
  const GoalCategoryModel({
    required this.id,
    required this.title,
    required this.iconKey,
    required this.category,
    required this.completionRate,
    required this.completedGoals,
    required this.totalGoals,
  });

  final String id;
  final String title;
  final String iconKey;
  final WellnessGoalCategoryType category;
  final double completionRate;
  final int completedGoals;
  final int totalGoals;

  String get percentageLabel {
    return '${(completionRate * 100).round()}%';
  }

  String get goalsLabel {
    return '$completedGoals/$totalGoals goals';
  }
}


