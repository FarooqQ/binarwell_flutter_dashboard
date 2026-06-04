class GoalSummaryModel {
  const GoalSummaryModel({
    required this.id,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.iconKey,
    this.progressValue,
    this.highlightText,
  });

  final String id;
  final String title;
  final String value;
  final String subtitle;
  final String iconKey;
  final double? progressValue;
  final String? highlightText;
}


