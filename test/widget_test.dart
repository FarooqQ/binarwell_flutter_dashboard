import 'package:carepulse_flutter_dashboard/app/carepulse_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarePulse overview renders successfully', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CarePulseApp());

    expect(find.text('CarePulse'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Wellness Overview'), findsOneWidget);

    expect(find.text('Wellness Score'), findsOneWidget);
    expect(find.text('82%'), findsOneWidget);

    expect(find.text('Steps Today'), findsOneWidget);
    expect(find.text('6,420'), findsOneWidget);

    expect(find.text('Sleep Quality'), findsOneWidget);
    expect(find.text('7.5 h'), findsOneWidget);

    expect(find.text('Weekly Movement'), findsOneWidget);
    expect(find.text('Daily Goals'), findsOneWidget);
    expect(find.text('Checkup Timeline'), findsOneWidget);
    expect(find.text('Vital Metrics'), findsOneWidget);
    expect(find.text('Body Balance'), findsOneWidget);

    expect(find.text('Heart Rate'), findsOneWidget);
    expect(find.text('Stress Index'), findsOneWidget);
    expect(find.text('Body Energy'), findsOneWidget);
    expect(find.text('Sleep Balance'), findsOneWidget);
  });

  testWidgets('CarePulse activity page renders after sidebar selection', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CarePulseApp());

    expect(find.text('Activity'), findsOneWidget);

    await tester.tap(find.text('Activity'));
    await tester.pumpAndSettle();

    expect(find.text('Activity'), findsWidgets);
    expect(find.text('Daily movement and fitness tracking'), findsOneWidget);

    expect(find.text('Today'), findsOneWidget);
    expect(find.text('Week'), findsOneWidget);
    expect(find.text('Month'), findsOneWidget);

    expect(find.text("Today's Movement"), findsOneWidget);
    expect(find.text('Activity Goals'), findsOneWidget);
    expect(find.text('Hourly Movement'), findsOneWidget);
    expect(find.text("Today's Activity Sessions"), findsOneWidget);
    expect(find.text('Intensity Zones'), findsOneWidget);
    expect(find.text('Activity Insights'), findsOneWidget);

    expect(find.text('Walk 8,000 Steps'), findsOneWidget);
    expect(find.text('Active for 45 Minutes'), findsOneWidget);
    expect(find.text('Walk 5 KM'), findsOneWidget);
    expect(find.text('Burn 300 Calories'), findsOneWidget);

    expect(find.text('Morning Walk'), findsOneWidget);
    expect(find.text('Lunch Break Walk'), findsOneWidget);
    expect(find.text('Evening Stretch'), findsOneWidget);

    expect(find.text('Light'), findsOneWidget);
    expect(find.text('Moderate'), findsOneWidget);
    expect(find.text('High'), findsOneWidget);

    expect(find.text('Best Active Hour'), findsOneWidget);
    expect(find.text('Weekly Average'), findsOneWidget);
    expect(find.text('Goal Achievement'), findsOneWidget);
  });
}
