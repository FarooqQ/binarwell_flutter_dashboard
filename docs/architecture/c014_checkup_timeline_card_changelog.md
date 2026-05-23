# C014 — Checkup Timeline Card Change Log

## Stage
C014 — Checkup Timeline Card

## Scope
Build a real checkup timeline card with status badges.

## Completed Actions
- Created CheckupTimelineCard.
- Created CheckupTimelineItem data class.
- Added timeline-style items with title and status.
- Added status badges for Upcoming, Scheduled, Completed, and Planned.
- Replaced the Checkup Timeline placeholder with a real widget.
- Increased the third dashboard row height from 160 to 260 to support real timeline content.
- Updated widget test to verify CheckupTimelineCard content.

## Files Created
- lib/features/dashboard/widgets/checkup_timeline_card.dart

## Files Updated
- lib/features/dashboard/layout/dashboard_content_grid.dart
- test/widget_test.dart

## Checkup Timeline Items Added
- Nutrition Review — Upcoming
- Blood Test — Scheduled
- Eye Check — Completed
- Fitness Assessment — Planned

## Validation
- dart format lib test
- flutter analyze: No issues found!
- flutter test: All tests passed!
- flutter run -d windows

## Scope Control
No vital metrics card was implemented.
No body balance card was implemented.
No mock data file was added.
No models folder was created.
No backend or database was added.
No real medical logic was implemented.

## Notes
This stage introduces a timeline-style dashboard card while keeping Vital Metrics and Body Balance as placeholders.
