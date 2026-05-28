import 'package:flutter/material.dart';

import 'widgets/activity_goals_card.dart';
import 'widgets/activity_insights_card.dart';
import 'widgets/activity_sessions_card.dart';
import 'widgets/activity_time_filter.dart';
import 'widgets/hourly_movement_chart_card.dart';
import 'widgets/intensity_zones_card.dart';
import 'widgets/today_movement_card.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  static const double _desktopLayoutBreakpoint = 1080;
  static const double _sectionGap = 18;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final useDesktopLayout =
            constraints.maxWidth >= _desktopLayoutBreakpoint;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _ActivityPageHeader(),
              const SizedBox(height: _sectionGap),
              const ActivityTimeFilter(),
              const SizedBox(height: _sectionGap),
              _ActivitySectionRow(
                useDesktopLayout: useDesktopLayout,
                leftFlex: 7,
                rightFlex: 5,
                leftChild: const TodayMovementCard(),
                rightChild: const ActivityGoalsCard(),
              ),
              const SizedBox(height: _sectionGap),
              _ActivitySectionRow(
                useDesktopLayout: useDesktopLayout,
                leftFlex: 7,
                rightFlex: 5,
                leftChild: const HourlyMovementChartCard(),
                rightChild: const ActivitySessionsCard(),
              ),
              const SizedBox(height: _sectionGap),
              _ActivitySectionRow(
                useDesktopLayout: useDesktopLayout,
                leftFlex: 2,
                rightFlex: 3,
                leftChild: const IntensityZonesCard(),
                rightChild: const ActivityInsightsCard(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ActivityPageHeader extends StatelessWidget {
  const _ActivityPageHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activity',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Daily movement and fitness tracking',
          style: TextStyle(
            color: Color(0xFF64748B),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _ActivitySectionRow extends StatelessWidget {
  const _ActivitySectionRow({
    required this.useDesktopLayout,
    required this.leftFlex,
    required this.rightFlex,
    required this.leftChild,
    required this.rightChild,
  });

  final bool useDesktopLayout;
  final int leftFlex;
  final int rightFlex;
  final Widget leftChild;
  final Widget rightChild;

  static const double _gap = 18;

  @override
  Widget build(BuildContext context) {
    if (!useDesktopLayout) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          leftChild,
          const SizedBox(height: _gap),
          rightChild,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: leftFlex, child: leftChild),
        const SizedBox(width: _gap),
        Expanded(flex: rightFlex, child: rightChild),
      ],
    );
  }
}
