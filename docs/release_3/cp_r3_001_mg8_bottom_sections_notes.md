# CP-R3-001-MG8 Bottom Sections Notes

## Purpose

This document records the implementation notes for the bottom sections of the Wellness Goals page.

## Recent Achievements

The Recent Achievements section displays motivational achievement cards.

Implemented items:

- 6-Day Streak
- Hydration Hero
- Mindful Moment

Each achievement tile includes:

- icon
- title
- subtitle
- badge label

## Wellness Insights

The Wellness Insights section displays short improvement signals.

Implemented items:

- Best Consistency: Hydration
- Weekly Average: 72%
- Next Priority: Balanced meals

Each insight tile includes:

- icon
- insight title
- value
- short subtitle

## Design Decision

The bottom sections use short text, compact tiles, and clear visual grouping.

The goal is to keep the page motivational without making the lower area visually crowded.

## Runtime Layout Safety

No Spacer widget is used.

No IntrinsicHeight widget is used.

The bottom sections use simple Row and Column layouts with responsive stacking below 900px.
