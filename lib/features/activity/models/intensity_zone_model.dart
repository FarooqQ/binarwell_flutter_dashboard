class IntensityZoneModel {
  const IntensityZoneModel({
    required this.label,
    required this.minutes,
    required this.percentage,
  });

  final String label;
  final int minutes;
  final double percentage;

  int get percentageLabel => (percentage * 100).round();
}

