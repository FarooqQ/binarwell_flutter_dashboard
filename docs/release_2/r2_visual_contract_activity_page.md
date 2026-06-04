# R2 Visual Contract � Activity Page

## Purpose

This document defines the official visual contract for the Activity page in BinarWell Flutter Dashboard v1.1.0.

The Activity page must be implemented according to the uploaded reference image:

Refererence_Activity_Page

## Page Identity

The Activity page is not a copy of the Overview page.

It must have its own identity as a daily movement and fitness tracking page.

## Required Header

The page header must include:

- Title: Activity
- Subtitle: Daily movement and fitness tracking

## Required Time Filter

The page must include a visual filter with:

- Today
- Week
- Month

In Release 2, Today can remain selected by default.

## Required Main Sections

The Activity page must contain the following sections:

### 1. Today's Movement

This must be the strongest visual section on the page.

It should include:

- Progress ring
- 6,420 steps
- 8,000 steps target
- 80% progress
- Daily goal status message
- Distance
- Active Time
- Calories
- Remaining Steps

### 2. Activity Goals

This section should include activity-specific goals:

- Walk 8,000 Steps
- Active for 45 Minutes
- Walk 5 KM
- Burn 300 Calories

Each goal should include:

- Icon
- Label
- Progress bar
- Percentage
- Current / target value

### 3. Hourly Movement

This section should show daily movement through the day.

It should include:

- Title: Hourly Movement
- Subtitle: Steps throughout the day
- Visual dropdown: Steps
- Line or area chart
- Hour labels from 12 AM to 12 AM

### 4. Today's Activity Sessions

This section should show daily activity sessions.

It should include:

- Morning Walk
- Lunch Break Walk
- Evening Stretch

Each session should show:

- Time
- Intensity
- Distance or duration
- Calories or activity description

### 5. Intensity Zones

This section should show time spent in activity intensity zones.

It should include:

- Light: 45% / 17 min
- Moderate: 35% / 13 min
- High: 20% / 8 min

### 6. Activity Insights

This section should show movement-related insights.

It should include:

- Best Active Hour
- Weekly Average
- Goal Achievement

## Layout Contract

The page layout should follow this structure:

Activity Page
- Page Header
- Today / Week / Month Filter
- Row 1:
  - Today's Movement
  - Activity Goals
- Row 2:
  - Hourly Movement
  - Today's Activity Sessions
- Row 3:
  - Intensity Zones
  - Activity Insights

## Visual Rules

The page must:

- Keep the BinarWell visual identity
- Use soft cards
- Use rounded corners
- Use clean spacing
- Use activity-focused icons
- Avoid looking like a duplicate of the Overview page
- Keep the sidebar stable
- Keep Activity active in the sidebar when selected

## Acceptance Criteria

- Activity page has its own visual identity
- Today's Movement is the strongest visual element
- Activity Goals are specific to activity tracking
- Hourly Movement is different from Overview weekly movement
- Activity Sessions look like a real activity timeline
- Intensity Zones are visible
- Activity Insights are visible
- No major overflow issues
- Page remains consistent with BinarWell design language


