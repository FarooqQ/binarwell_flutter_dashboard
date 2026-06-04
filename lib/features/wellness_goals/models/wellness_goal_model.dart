enum WellnessGoalStatus { completed, inProgress, pending }

enum WellnessGoalCategoryType {
  hydration,
  sleep,
  activity,
  mindfulness,
  nutrition,
}

class WellnessGoalModel {
  const WellnessGoalModel({
    required this.id,
    required this.title,
    required this.iconKey,
    required this.targetValue,
    required this.currentValue,
    required this.unit,
    required this.status,
    required this.category,
    required this.weeklyProgress,
  });

  final String id;
  final String title;
  final String iconKey;
  final double targetValue;
  final double currentValue;
  final String unit;
  final WellnessGoalStatus status;
  final WellnessGoalCategoryType category;
  final List<double> weeklyProgress;

  double get completionRate {
    if (targetValue <= 0) {
      return 0;
    }

    final value = currentValue / targetValue;

    if (value < 0) {
      return 0;
    }

    if (value > 1) {
      return 1;
    }

    return value;
  }

  bool get isCompleted {
    return status == WellnessGoalStatus.completed ||
        currentValue >= targetValue;
  }

  String get progressLabel {
    return '${_formatNumber(currentValue)} of ${_formatNumber(targetValue)} $unit';
  }
}

String _formatNumber(double value) {
  if (value % 1 == 0) {
    return value.toInt().toString();
  }

  return value.toStringAsFixed(1);
}

