# CP-R3-001-MG5 KPI Design Notes

## Purpose

This document records the design decisions for the Wellness Goals header and KPI summary cards.

## Header Design

The header includes:

- Wellness Goals page title
- Short subtitle
- Today filter button
- Add Goal button
- Notification icon
- Profile icon

## Add Goal Button

The Add Goal button is intentionally styled with the primary green/teal wellness color to make it clear and visible.

This follows the approved visual direction for the Wellness Goals page.

## KPI Cards

The page includes four top KPI cards:

1. Today’s Goal Completion
   - Value: 5 of 7
   - Meaning: completed goals today

2. Current Streak
   - Value: 6 days
   - Meaning: habit consistency streak

3. Active Goals
   - Value: 7
   - Meaning: current goals being tracked this week

4. Weekly Completion Rate
   - Value: 72%
   - Meaning: weekly average completion

## Design Principle

Each KPI card must have a different meaning.

The cards should not repeat the same concept using different labels.

## Data Source

The KPI cards use WellnessGoalsMockData.summaryCards.

This keeps the UI separate from hardcoded values and prepares the page for future real data integration.

## Current Status

Header and KPI cards are implemented.

The remaining page sections are still placeholders and will be completed in later micro-gates.
