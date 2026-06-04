# CP-R3-001-MG9 Responsive Layout Review

## Micro-Gate

CP-R3-001-MG9 — Responsive Layout Review

## Page

Wellness Goals

## Purpose

This review validates that the Wellness Goals page works visually and technically across different desktop window sizes.

## Review Areas

The review focuses on:

- Overall page spacing
- Sidebar and main content alignment
- KPI cards responsiveness
- Today’s Goal Checklist layout
- Goal Focus of the Week layout
- Weekly Goal Planner layout
- Goal Categories layout
- Recent Achievements layout
- Wellness Insights layout
- Horizontal scrolling behavior
- Runtime layout stability

## Required Visual Checks

### Large Desktop

Expected result:

- Header is aligned correctly.
- KPI cards are shown in one row.
- Checklist and Focus cards appear side by side.
- Weekly Planner and Goal Categories appear side by side.
- Bottom sections appear side by side.
- No unnecessary large horizontal gaps.
- No overflow warning appears.

Suggested screenshot name:

```text
wellness_goals_large_desktop.png

Medium Desktop

Expected result:

Main sections remain readable.
Cards stay aligned.
Weekly Planner remains usable.
No broken weekday labels.
No yellow/black overflow stripes.
No blank screen.

Suggested screenshot name:

wellness_goals_medium_desktop.png
Small Window

Expected result:

Horizontal scrolling works when the minimum dashboard width is larger than the window.
Content remains readable.
Sidebar remains stable.
No runtime rendering exception appears.

Suggested screenshot name:

wellness_goals_small_window.png
Known Responsive Decisions

The Wellness Goals page currently uses a desktop dashboard layout with controlled minimum width.

The page is not designed as a mobile-first layout in Release 3.

For desktop portfolio presentation, the current responsive goal is:

stable desktop layout
safe horizontal scroll on smaller windows
no overflow errors
no blank screen
visually balanced card spacing
Runtime Validation

The page must be tested with:

flutter run -d windows

The visual validation is required because previous layout issues were not caught by flutter analyze or flutter test.

Review Status

PENDING
