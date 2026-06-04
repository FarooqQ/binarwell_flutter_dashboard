import 'package:flutter/material.dart';

import '../../../app/theme/app_spacing.dart';
import '../models/vital_metric.dart';
import 'dashboard_card.dart';
import 'metric_tile.dart';

class VitalMetricsCard extends StatelessWidget {
  const VitalMetricsCard({required this.metrics, super.key});

  final List<VitalMetric> metrics;

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      title: 'Vital Metrics',
      subtitle: 'General wellness indicators',
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (var index = 0; index < metrics.length; index++) ...[
              MetricTile(
                label: metrics[index].label,
                value: metrics[index].value,
                icon: metrics[index].icon,
              ),
              if (index != metrics.length - 1)
                const SizedBox(height: AppSpacing.sm),
            ],
          ],
        ),
      ),
    );
  }
}

