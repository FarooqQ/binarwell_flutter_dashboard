import 'package:flutter/material.dart';

import '../../data/wellness_goals_mock_data.dart';
import 'goal_summary_card.dart';

class GoalSummaryCards extends StatelessWidget {
  const GoalSummaryCards({super.key});

  static const double _gap = 16;
  static const double _minimumCardWidth = 230;

  @override
  Widget build(BuildContext context) {
    final summaryCards = WellnessGoalsMockData.summaryCards;

    return LayoutBuilder(
      builder: (context, constraints) {
        final columnCount = _resolveColumnCount(constraints.maxWidth);
        final totalGap = _gap * (columnCount - 1);
        final cardWidth = (constraints.maxWidth - totalGap) / columnCount;

        return Wrap(
          spacing: _gap,
          runSpacing: _gap,
          children: [
            for (final summary in summaryCards)
              SizedBox(
                width: cardWidth,
                child: GoalSummaryCard(summary: summary),
              ),
          ],
        );
      },
    );
  }

  int _resolveColumnCount(double width) {
    if (width >= _minimumCardWidth * 4 + _gap * 3) {
      return 4;
    }

    if (width >= _minimumCardWidth * 2 + _gap) {
      return 2;
    }

    return 1;
  }
}
