import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../data/activity_mock_data.dart';
import '../../models/intensity_zone_model.dart';

class IntensityZonesCard extends StatelessWidget {
  const IntensityZonesCard({super.key});

  static const Color _textColor = Color(0xFF0F172A);
  static const Color _mutedTextColor = Color(0xFF64748B);
  static const Color _borderColor = Color(0xFFE2E8F0);
  static const Color _lightColor = Color(0xFF0BAE9A);
  static const Color _moderateColor = Color(0xFFF59E0B);
  static const Color _highColor = Color(0xFFEF4444);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: _borderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final useCompactLayout = constraints.maxWidth < 420;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _IntensityHeader(),
              const SizedBox(height: 18),
              if (useCompactLayout)
                const Column(
                  children: [
                    _IntensityDonut(),
                    SizedBox(height: 18),
                    _IntensityLegend(),
                  ],
                )
              else
                const Row(
                  children: [
                    _IntensityDonut(),
                    SizedBox(width: 22),
                    Expanded(child: _IntensityLegend()),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  static Color colorForLabel(String label) {
    switch (label) {
      case 'Light':
        return _lightColor;
      case 'Moderate':
        return _moderateColor;
      case 'High':
        return _highColor;
      default:
        return _mutedTextColor;
    }
  }
}

class _IntensityHeader extends StatelessWidget {
  const _IntensityHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Intensity Zones',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: IntensityZonesCard._textColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Time spent in each intensity zone',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: IntensityZonesCard._mutedTextColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _IntensityDonut extends StatelessWidget {
  const _IntensityDonut();

  @override
  Widget build(BuildContext context) {
    final zones = ActivityMockData.intensityZones;

    return SizedBox(
      width: 132,
      height: 132,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(132, 132),
            painter: _IntensityDonutPainter(zones: zones),
          ),
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(31),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: const Icon(
              Icons.monitor_heart_rounded,
              color: Color(0xFF94A3B8),
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

class _IntensityLegend extends StatelessWidget {
  const _IntensityLegend();

  @override
  Widget build(BuildContext context) {
    final zones = ActivityMockData.intensityZones;

    return Column(
      children: [
        for (var index = 0; index < zones.length; index++) ...[
          _IntensityLegendRow(zone: zones[index]),
          if (index != zones.length - 1) const SizedBox(height: 14),
        ],
      ],
    );
  }
}

class _IntensityLegendRow extends StatelessWidget {
  const _IntensityLegendRow({required this.zone});

  final IntensityZoneModel zone;

  @override
  Widget build(BuildContext context) {
    final zoneColor = IntensityZonesCard.colorForLabel(zone.label);

    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: zoneColor,
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            zone.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: IntensityZonesCard._textColor,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '${zone.percentageLabel}%',
          style: const TextStyle(
            color: IntensityZonesCard._textColor,
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(width: 18),
        SizedBox(
          width: 46,
          child: Text(
            '${zone.minutes} min',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: IntensityZonesCard._mutedTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _IntensityDonutPainter extends CustomPainter {
  const _IntensityDonutPainter({required this.zones});

  final List<IntensityZoneModel> zones;

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 18.0;
    final rect = Offset.zero & size;

    final backgroundPaint = Paint()
      ..color = const Color(0xFFE8EEF4)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    canvas.drawArc(
      rect.deflate(strokeWidth / 2),
      -math.pi / 2,
      math.pi * 2,
      false,
      backgroundPaint,
    );

    var startAngle = -math.pi / 2;

    for (final zone in zones) {
      final sweepAngle = zone.percentage * math.pi * 2;
      final paint = Paint()
        ..color = IntensityZonesCard.colorForLabel(zone.label)
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        rect.deflate(strokeWidth / 2),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant _IntensityDonutPainter oldDelegate) {
    return oldDelegate.zones != zones;
  }
}
