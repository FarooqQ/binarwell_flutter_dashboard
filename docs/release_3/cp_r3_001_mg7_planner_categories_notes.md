# CP-R3-001-MG7 Planner and Categories Notes

## Purpose

This document records the implementation notes for:

- Weekly Goal Planner
- Goal Categories

## Weekly Goal Planner

The Weekly Goal Planner shows goal consistency across the week.

Columns:

- Goal
- Mon
- Tue
- Wed
- Thu
- Fri
- Sat
- Sun
- Rate

Rows are based on WellnessGoalsMockData.todayGoals:

- Drink 8 cups of water
- Sleep 7 hours
- Walk 30 minutes
- Mindful break
- Balanced meals

## Weekly Progress Design

Each day is represented with a compact progress dot.

A completed day uses a check mark.

Partial progress uses a smaller filled indicator inside the dot.

## Goal Categories

The Goal Categories section shows progress grouped by wellness area:

- Hydration
- Sleep
- Nutrition
- Mindfulness
- Activity

Each category includes:

- icon
- category name
- completed goals label
- progress bar
- percentage label

## Layout Safety

Weekly Goal Planner uses horizontal scrolling inside the card to avoid overflow on smaller widths.

No Spacer widget is used inside the scrollable Wellness Goals page.

