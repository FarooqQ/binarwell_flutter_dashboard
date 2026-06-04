import 'package:binarwell_flutter_dashboard/features/wellness_goals/presentation/wellness_goals_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WellnessGoalsPage', () {
    testWidgets('renders the main Wellness Goals sections', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 1400,
              height: 1200,
              child: WellnessGoalsPage(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('wellness-goals-page')), findsOneWidget);
      expect(find.byKey(const Key('wellness-goals-title')), findsOneWidget);
      expect(
        find.byKey(const Key('wellness-goals-today-filter-button')),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key('wellness-goals-add-goal-button')),
        findsOneWidget,
      );

      expect(
        find.byKey(const Key('todays-goal-checklist-title')),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key('goal-focus-of-the-week-title')),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key('weekly-goal-planner-title')),
        findsOneWidget,
      );
      expect(find.byKey(const Key('goal-categories-title')), findsOneWidget);
      expect(
        find.byKey(const Key('recent-achievements-title')),
        findsOneWidget,
      );
      expect(find.byKey(const Key('wellness-insights-title')), findsOneWidget);
    });

    testWidgets('renders important Wellness Goals data labels', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 1400,
              height: 1200,
              child: WellnessGoalsPage(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Wellness Goals'), findsOneWidget);
      expect(find.text('Add Goal'), findsOneWidget);
      expect(find.text('Today'), findsWidgets);

      expect(find.text('Drink 8 cups of water'), findsWidgets);
      expect(find.text('Sleep 7 hours'), findsWidgets);
      expect(find.text('Walk 30 minutes'), findsWidgets);
      expect(find.text('Balanced meals'), findsWidgets);

      expect(find.text('Hydration'), findsWidgets);
      expect(find.text('Sleep'), findsWidgets);
      expect(find.text('Nutrition'), findsOneWidget);
      expect(find.text('Activity'), findsOneWidget);

      expect(find.text('6-Day Streak'), findsOneWidget);
      expect(find.text('Hydration Hero'), findsOneWidget);
      expect(find.text('Mindful Moment'), findsOneWidget);

      expect(find.text('Best Consistency'), findsOneWidget);
      expect(find.text('Weekly Average'), findsOneWidget);
      expect(find.text('Next Priority'), findsOneWidget);
    });
  });
}


