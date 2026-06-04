# C012 — Weekly Movement Card Change Log

## Stage
C012 — Weekly Movement Card

## Scope
Build a real weekly movement card using a simple manual bar chart.

## Completed Actions
- Created WeeklyMovementCard.
- Created WeeklyMovementItem data class.
- Added a manual bar chart using Row, Expanded, FractionallySizedBox, and Container.
- Added weekly movement values from Monday to Sunday.
- Replaced the Weekly Movement placeholder with a real widget.
- Increased the second dashboard row height from 160 to 220 to support real chart content.
- Updated widget test to verify WeeklyMovementCard content.

## Files Created
- lib/features/dashboard/widgets/weekly_movement_card.dart

## Files Updated
- lib/features/dashboard/layout/dashboard_content_grid.dart
- test/widget_test.dart

## Weekly Movement Data
- Mon: 4200
- Tue: 5800
- Wed: 6100
- Thu: 3900
- Fri: 7200
- Sat: 6500
- Sun: 5400

## Validation
- dart format lib test
- flutter analyze: No issues found!
- flutter test: All tests passed!
- flutter run -d windows

## Scope Control
No daily goals card was implemented.
No checkup timeline card was implemented.
No vital metrics card was implemented.
No body balance card was implemented.
No external chart package was added.
No mock data file was added.
No models folder was created.
No backend or database was added.

## Notes
This stage introduces the first simple chart-like dashboard card without external dependencies.

