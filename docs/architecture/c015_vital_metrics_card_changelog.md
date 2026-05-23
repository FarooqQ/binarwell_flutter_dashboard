# C015 — Vital Metrics Card Change Log

## Stage
C015 — Vital Metrics Card

## Scope
Build a real vital metrics card using a reusable MetricTile widget.

## Completed Actions
- Created MetricTile reusable widget.
- Created VitalMetricsCard.
- Added four general wellness indicator tiles.
- Replaced the Vital Metrics placeholder with a real widget.
- Updated widget test to verify VitalMetricsCard content.

## Files Created
- lib/features/dashboard/widgets/metric_tile.dart
- lib/features/dashboard/widgets/vital_metrics_card.dart

## Files Updated
- lib/features/dashboard/layout/dashboard_content_grid.dart
- test/widget_test.dart

## Vital Metrics Added
- Heart Rate: 72 bpm
- Blood Pressure: 118/76
- Oxygen Level: 97%
- Stress Index: Low

## Validation
- dart format lib test
- flutter analyze: No issues found!
- flutter test: All tests passed!
- flutter run -d windows

## Scope Control
No body balance card was implemented.
No mock data file was added.
No models folder was created.
No backend or database was added.
No real medical logic was implemented.

## Notes
This stage introduces a reusable MetricTile component that can be reused later in other dashboard cards.
