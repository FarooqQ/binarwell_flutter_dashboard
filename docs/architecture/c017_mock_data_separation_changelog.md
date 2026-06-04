# C017 — Mock Data Separation Change Log

## Stage
C017 — Mock Data Separation

## Scope
Separate mock dashboard data from UI widgets into models and a centralized mock data file.

## Completed Actions
- Created dashboard models folder.
- Created dashboard data folder.
- Created WellnessGoal model.
- Created VitalMetric model.
- Created CheckupItem model.
- Created ActivitySummary model.
- Moved weekly movement and body balance data types into activity_summary.dart.
- Created MockBinarWellData.
- Updated DashboardContentGrid to read data from MockBinarWellData.
- Updated DailyGoalsCard to use WellnessGoal.
- Updated CheckupTimelineCard to use CheckupItem.
- Updated VitalMetricsCard to receive a list of VitalMetric.
- Updated WeeklyMovementCard and BodyBalanceCard to use shared activity models.
- Updated widget test to verify dashboard rendering after data separation.

## Files Created
- lib/features/dashboard/models/wellness_goal.dart
- lib/features/dashboard/models/vital_metric.dart
- lib/features/dashboard/models/checkup_item.dart
- lib/features/dashboard/models/activity_summary.dart
- lib/features/dashboard/data/mock_BinarWell_data.dart

## Files Updated
- lib/features/dashboard/layout/dashboard_content_grid.dart
- lib/features/dashboard/widgets/daily_goals_card.dart
- lib/features/dashboard/widgets/checkup_timeline_card.dart
- lib/features/dashboard/widgets/vital_metrics_card.dart
- lib/features/dashboard/widgets/weekly_movement_card.dart
- lib/features/dashboard/widgets/body_balance_card.dart
- test/widget_test.dart

## Validation
- dart format lib test
- flutter analyze: No issues found!
- flutter test: All tests passed!
- flutter run -d windows

## Scope Control
No backend was added.
No database was added.
No API layer was added.
No real medical logic was implemented.
No responsive polishing was added.

## Notes
This stage improves separation of concerns by moving mock values out of widgets and into a centralized mock data source.

