class ActivityGoalModel {
  const ActivityGoalModel({
    required this.label,
    required this.currentValue,
    required this.targetValue,
    required this.progress,
    required this.iconKey,
  });

  final String label;
  final String currentValue;
  final String targetValue;
  final double progress;
  final String iconKey;

  int get percentage => (progress * 100).round();
}

