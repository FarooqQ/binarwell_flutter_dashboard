import '../models/goal_achievement_model.dart';
import '../models/goal_category_model.dart';
import '../models/goal_summary_model.dart';
import '../models/wellness_goal_model.dart';
import '../models/wellness_insight_model.dart';

class WellnessGoalsMockData {
  const WellnessGoalsMockData._();

  static const List<GoalSummaryModel> summaryCards = [
    GoalSummaryModel(
      id: 'today_completion',
      title: 'Today’s Goal Completion',
      value: '5 of 7',
      subtitle: 'goals completed today',
      iconKey: 'check',
      progressValue: 0.71,
      highlightText: 'Good progress',
    ),
    GoalSummaryModel(
      id: 'current_streak',
      title: 'Current Streak',
      value: '6 days',
      subtitle: 'Keep it up!',
      iconKey: 'flame',
      progressValue: 0.60,
      highlightText: 'Strong habit',
    ),
    GoalSummaryModel(
      id: 'active_goals',
      title: 'Active Goals',
      value: '7',
      subtitle: 'ongoing goals this week',
      iconKey: 'target',
      progressValue: 0.70,
      highlightText: 'This week',
    ),
    GoalSummaryModel(
      id: 'weekly_completion',
      title: 'Weekly Completion Rate',
      value: '72%',
      subtitle: 'average completion this week',
      iconKey: 'progress',
      progressValue: 0.72,
      highlightText: 'Stable week',
    ),
  ];

  static const List<WellnessGoalModel> todayGoals = [
    WellnessGoalModel(
      id: 'water',
      title: 'Drink 8 cups of water',
      iconKey: 'water',
      targetValue: 8,
      currentValue: 6,
      unit: 'cups',
      status: WellnessGoalStatus.inProgress,
      category: WellnessGoalCategoryType.hydration,
      weeklyProgress: [1, 1, 0.75, 1, 0.50, 0.75, 0.75],
    ),
    WellnessGoalModel(
      id: 'sleep',
      title: 'Sleep 7 hours',
      iconKey: 'moon',
      targetValue: 7,
      currentValue: 6.5,
      unit: 'hours',
      status: WellnessGoalStatus.inProgress,
      category: WellnessGoalCategoryType.sleep,
      weeklyProgress: [0.85, 0.90, 1, 0.75, 0.90, 0.80, 0.90],
    ),
    WellnessGoalModel(
      id: 'walk',
      title: 'Walk 30 minutes',
      iconKey: 'walk',
      targetValue: 30,
      currentValue: 24,
      unit: 'min',
      status: WellnessGoalStatus.inProgress,
      category: WellnessGoalCategoryType.activity,
      weeklyProgress: [1, 0.60, 0.75, 0.80, 0.90, 0.70, 0.80],
    ),
    WellnessGoalModel(
      id: 'mindful_break',
      title: 'Mindful break',
      iconKey: 'leaf',
      targetValue: 10,
      currentValue: 10,
      unit: 'min',
      status: WellnessGoalStatus.completed,
      category: WellnessGoalCategoryType.mindfulness,
      weeklyProgress: [0.60, 0.80, 1, 0.70, 1, 0.80, 1],
    ),
    WellnessGoalModel(
      id: 'balanced_meals',
      title: 'Balanced meals',
      iconKey: 'meal',
      targetValue: 3,
      currentValue: 2,
      unit: 'meals',
      status: WellnessGoalStatus.inProgress,
      category: WellnessGoalCategoryType.nutrition,
      weeklyProgress: [0.65, 0.70, 0.60, 0.75, 0.70, 0.60, 0.67],
    ),
  ];

  static const List<WellnessGoalModel> focusGoals = [
    WellnessGoalModel(
      id: 'focus_hydration',
      title: 'Hydration',
      iconKey: 'water',
      targetValue: 8,
      currentValue: 6,
      unit: 'cups',
      status: WellnessGoalStatus.inProgress,
      category: WellnessGoalCategoryType.hydration,
      weeklyProgress: [1, 1, 0.75, 1, 0.50, 0.75, 0.75],
    ),
    WellnessGoalModel(
      id: 'focus_sleep',
      title: 'Sleep Routine',
      iconKey: 'moon',
      targetValue: 7,
      currentValue: 6.5,
      unit: 'hours',
      status: WellnessGoalStatus.inProgress,
      category: WellnessGoalCategoryType.sleep,
      weeklyProgress: [0.85, 0.90, 1, 0.75, 0.90, 0.80, 0.90],
    ),
    WellnessGoalModel(
      id: 'focus_mindfulness',
      title: 'Mindfulness',
      iconKey: 'leaf',
      targetValue: 10,
      currentValue: 10,
      unit: 'min',
      status: WellnessGoalStatus.completed,
      category: WellnessGoalCategoryType.mindfulness,
      weeklyProgress: [0.60, 0.80, 1, 0.70, 1, 0.80, 1],
    ),
  ];

  static const List<GoalCategoryModel> categories = [
    GoalCategoryModel(
      id: 'hydration',
      title: 'Hydration',
      iconKey: 'water',
      category: WellnessGoalCategoryType.hydration,
      completionRate: 0.75,
      completedGoals: 6,
      totalGoals: 8,
    ),
    GoalCategoryModel(
      id: 'sleep',
      title: 'Sleep',
      iconKey: 'moon',
      category: WellnessGoalCategoryType.sleep,
      completionRate: 0.78,
      completedGoals: 5,
      totalGoals: 7,
    ),
    GoalCategoryModel(
      id: 'nutrition',
      title: 'Nutrition',
      iconKey: 'meal',
      category: WellnessGoalCategoryType.nutrition,
      completionRate: 0.67,
      completedGoals: 4,
      totalGoals: 6,
    ),
    GoalCategoryModel(
      id: 'mindfulness',
      title: 'Mindfulness',
      iconKey: 'leaf',
      category: WellnessGoalCategoryType.mindfulness,
      completionRate: 0.60,
      completedGoals: 3,
      totalGoals: 5,
    ),
    GoalCategoryModel(
      id: 'activity',
      title: 'Activity',
      iconKey: 'walk',
      category: WellnessGoalCategoryType.activity,
      completionRate: 0.71,
      completedGoals: 5,
      totalGoals: 7,
    ),
  ];

  static const List<GoalAchievementModel> achievements = [
    GoalAchievementModel(
      id: 'six_day_streak',
      title: '6-Day Streak',
      subtitle: 'Daily goal progress',
      iconKey: 'flame',
      badgeLabel: 'Today',
    ),
    GoalAchievementModel(
      id: 'hydration_hero',
      title: 'Hydration Hero',
      subtitle: 'Water goal improved',
      iconKey: 'water',
      badgeLabel: 'This week',
    ),
    GoalAchievementModel(
      id: 'mindful_moment',
      title: 'Mindful Moment',
      subtitle: 'Focus break completed',
      iconKey: 'leaf',
      badgeLabel: 'New',
    ),
  ];

  static const List<WellnessInsightModel> insights = [
    WellnessInsightModel(
      id: 'best_consistency',
      title: 'Best Consistency',
      value: 'Hydration',
      subtitle: 'Highest weekly habit',
      iconKey: 'trophy',
    ),
    WellnessInsightModel(
      id: 'weekly_average',
      title: 'Weekly Average',
      value: '72%',
      subtitle: 'overall completion',
      iconKey: 'chart',
    ),
    WellnessInsightModel(
      id: 'next_priority',
      title: 'Next Priority',
      value: 'Balanced meals',
      subtitle: 'needs more focus',
      iconKey: 'target',
    ),
  ];
}


