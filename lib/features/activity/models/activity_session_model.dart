class ActivitySessionModel {
  const ActivitySessionModel({
    required this.title,
    required this.time,
    required this.intensity,
    required this.primaryMetric,
    required this.secondaryMetric,
    required this.calories,
  });

  final String title;
  final String time;
  final String intensity;
  final String primaryMetric;
  final String secondaryMetric;
  final String calories;
}


