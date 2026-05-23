import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'dashboard_main_area.dart';
import 'wellness_sidebar.dart';

class DashboardShell extends StatelessWidget {
  const DashboardShell({super.key});

  static const double _minimumDashboardWidth = 980;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final shellWidth = math.max(
          constraints.maxWidth,
          _minimumDashboardWidth,
        );

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: shellWidth,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                WellnessSidebar(),
                Expanded(child: DashboardMainArea()),
              ],
            ),
          ),
        );
      },
    );
  }
}
