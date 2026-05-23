class ActivitySummary {
  const ActivitySummary({
    required this.scorePercent,
    required this.energyLevel,
    required this.hydrationPercent,
    required this.recoveryPercent,
    required this.stepsToday,
    required this.sleepQuality,
    required this.weeklyMovement,
    required this.bodyBalance,
  });

  final int scorePercent;
  final String energyLevel;
  final int hydrationPercent;
  final int recoveryPercent;
  final String stepsToday;
  final String sleepQuality;
  final List<WeeklyMovementItem> weeklyMovement;
  final List<BodyBalanceItem> bodyBalance;
}

class WeeklyMovementItem {
  const WeeklyMovementItem({required this.day, required this.steps});

  final String day;
  final int steps;
}

class BodyBalanceItem {
  const BodyBalanceItem({required this.label, required this.percent});

  final String label;
  final int percent;
}
