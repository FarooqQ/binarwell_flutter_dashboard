# CP-R3-001-MG2 Data Model Notes

## Purpose

The Wellness Goals data layer was created before UI implementation to keep the page clean, reusable, and easier to test.

## Created Models

### WellnessGoalModel

Represents a single wellness goal such as hydration, sleep, walking, mindfulness, or balanced meals.

It includes:

- goal title
- icon key
- target value
- current value
- unit
- completion status
- category
- weekly progress

### GoalSummaryModel

Represents the top KPI cards used in the Wellness Goals page.

Examples:

- Today’s Goal Completion
- Current Streak
- Active Goals
- Weekly Completion Rate

### GoalCategoryModel

Represents goal progress grouped by wellness category.

Examples:

- Hydration
- Sleep
- Nutrition
- Mindfulness
- Activity

### GoalAchievementModel

Represents motivational achievement cards.

Examples:

- 6-Day Streak
- Hydration Hero
- Mindful Moment

### WellnessInsightModel

Represents short insight cards shown at the bottom of the page.

Examples:

- Best Consistency
- Weekly Average
- Next Priority

## Mock Data Strategy

The mock data is intentionally simple and readable.

It is designed to support the approved Wellness Goals visual reference without adding backend complexity at this stage.

## Design Benefit

This structure prevents the future UI widgets from containing hardcoded values directly inside the widget tree.

The page can later be connected to real data without redesigning the UI.

