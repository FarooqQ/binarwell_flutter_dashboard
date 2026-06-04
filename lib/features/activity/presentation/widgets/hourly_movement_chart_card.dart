import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../data/activity_mock_data.dart';
import '../../models/hourly_movement_model.dart';

class HourlyMovementChartCard extends StatelessWidget {
  const HourlyMovementChartCard({super.key});

  static const Color _primaryColor = Color(0xFF0BAE9A);
  static const Color _textColor = Color(0xFF0F172A);
  static const Color _mutedTextColor = Color(0xFF64748B);
  static const Color _borderColor = Color(0xFFE2E8F0);
  static const Color _softBackground = Color(0xFFE4F8F5);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _HourlyMovementHeader(),
          SizedBox(height: 22),
          _HourlyMovementChart(),
        ],
      ),
    );
  }
}

class _HourlyMovementHeader extends StatelessWidget {
  const _HourlyMovementHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hourly Movement',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: HourlyMovementChartCard._textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Steps throughout the day',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: HourlyMovementChartCard._mutedTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12),
        _MetricDropdownBadge(),
      ],
    );
  }
}

class _MetricDropdownBadge extends StatelessWidget {
  const _MetricDropdownBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: HourlyMovementChartCard._softBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Steps',
            style: TextStyle(
              color: HourlyMovementChartCard._primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(width: 4),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: HourlyMovementChartCard._primaryColor,
            size: 18,
          ),
        ],
      ),
    );
  }
}

class _HourlyMovementChart extends StatelessWidget {
  const _HourlyMovementChart();

  @override
  Widget build(BuildContext context) {
    final movements = ActivityMockData.hourlyMovement;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 190,
          child: CustomPaint(
            painter: _HourlyMovementChartPainter(movements: movements),
            child: const SizedBox.expand(),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            for (final item in movements)
              Expanded(
                child: Text(
                  item.hourLabel,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: HourlyMovementChartCard._mutedTextColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _HourlyMovementChartPainter extends CustomPainter {
  const _HourlyMovementChartPainter({required this.movements});

  final List<HourlyMovementModel> movements;

  @override
  void paint(Canvas canvas, Size size) {
    if (movements.isEmpty) {
      return;
    }

    const topPadding = 18.0;
    const bottomPadding = 18.0;
    const leftPadding = 10.0;
    const rightPadding = 10.0;

    final chartWidth = size.width - leftPadding - rightPadding;
    final chartHeight = size.height - topPadding - bottomPadding;
    final chartBottom = size.height - bottomPadding;

    final maxSteps = math.max(
      1,
      movements.map((item) => item.steps).reduce(math.max),
    );

    final gridPaint = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..strokeWidth = 1;

    for (var index = 0; index < 4; index++) {
      final y = topPadding + (chartHeight / 3) * index;
      canvas.drawLine(
        Offset(leftPadding, y),
        Offset(size.width - rightPadding, y),
        gridPaint,
      );
    }

    final points = <Offset>[];

    for (var index = 0; index < movements.length; index++) {
      final item = movements[index];
      final x = movements.length == 1
          ? size.width / 2
          : leftPadding + (chartWidth / (movements.length - 1)) * index;

      final normalizedValue = item.steps / maxSteps;
      final y = topPadding + (1 - normalizedValue) * chartHeight;

      points.add(Offset(x, y));
    }

    final areaPath = Path()..moveTo(points.first.dx, chartBottom);

    for (final point in points) {
      areaPath.lineTo(point.dx, point.dy);
    }

    areaPath
      ..lineTo(points.last.dx, chartBottom)
      ..close();

    final areaPaint = Paint()
      ..color = const Color(0x1A0BAE9A)
      ..style = PaintingStyle.fill;

    canvas.drawPath(areaPath, areaPaint);

    final linePath = Path()..moveTo(points.first.dx, points.first.dy);

    for (final point in points.skip(1)) {
      linePath.lineTo(point.dx, point.dy);
    }

    final linePaint = Paint()
      ..color = HourlyMovementChartCard._primaryColor
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    canvas.drawPath(linePath, linePaint);

    final pointPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final pointBorderPaint = Paint()
      ..color = HourlyMovementChartCard._primaryColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    for (final point in points) {
      canvas.drawCircle(point, 5, pointPaint);
      canvas.drawCircle(point, 5, pointBorderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _HourlyMovementChartPainter oldDelegate) {
    return oldDelegate.movements != movements;
  }
}


