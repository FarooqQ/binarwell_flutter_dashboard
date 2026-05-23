import 'package:flutter_test/flutter_test.dart';
import 'package:carepulse_flutter_dashboard/app/carepulse_app.dart';

void main() {
  testWidgets('CarePulse dashboard renders successfully after UI polish', (
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
}
