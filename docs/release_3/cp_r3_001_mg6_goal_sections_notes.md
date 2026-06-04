# CP-R3-001-MG6 Goal Sections Notes

## Purpose

This document records the implementation notes for the two main Wellness Goals sections:

- Today’s Goal Checklist
- Goal Focus of the Week

## Today’s Goal Checklist

The checklist section displays daily goals from WellnessGoalsMockData.todayGoals.

Each item includes:

- icon
- checkbox
- title
- progress bar
- progress text
- arrow icon

Included goals:

- Drink 8 cups of water
- Sleep 7 hours
- Walk 30 minutes
- Mindful break
- Balanced meals

## Goal Focus of the Week

The focus section displays the most important goals for the current week from WellnessGoalsMockData.focusGoals.

Each item includes:

- icon
- goal title
- target/progress text
- progress bar
- status pill

Included focus goals:

- Hydration
- Sleep Routine
- Mindfulness

## Design Decision

The text density is intentionally reduced.

The goal of this stage is to make the middle of the page clear, readable, and visually different from the Activity page.

## Runtime Layout Safety

No Spacer widget is used inside the scrollable Wellness Goals page.

This avoids unbounded height layout problems in Flutter desktop runtime.
