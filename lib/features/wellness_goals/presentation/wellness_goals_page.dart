import 'package:flutter/material.dart';

import 'widgets/wellness_goals_header.dart';
import 'widgets/wellness_goals_layout.dart';

class WellnessGoalsPage extends StatelessWidget {
  const WellnessGoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      key: Key('wellness-goals-page'),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WellnessGoalsHeader(),
          SizedBox(height: 18),
          WellnessGoalsLayout(),
        ],
      ),
    );
  }
}
