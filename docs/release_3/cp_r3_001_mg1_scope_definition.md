# CP-R3-001-MG1 — Wellness Goals Scope Definition

## Project

BinarWell Flutter Dashboard

## Target Version

v1.2.0

## Release

Release 3 — Wellness Goals Expansion

---

## Purpose

The purpose of Release 3 is to expand BinarWell Flutter Dashboard by adding a dedicated Wellness Goals page.

This page should help users understand their personal wellness targets, active goals, progress level, completion rate, and weekly wellness direction.

---

## Page Objective

The Wellness Goals page should answer these questions:

- What are my active wellness goals?
- How much progress have I made?
- Which goals are completed or still active?
- What is my overall completion rate?
- What should I focus on this week?
- Which wellness areas need attention?

---

## Main Functional Scope

Release 3 should include:

- Wellness Goals page structure
- Sidebar navigation integration
- Wellness Goals active sidebar state
- Mock wellness goals data
- Goal summary cards
- Active goals list
- Goal progress indicators
- Completion rate display
- Weekly goal plan section
- Wellness insights card
- Responsive layout review
- Widget test coverage
- Documentation update
- Screenshot preparation
- GitHub release preparation

---

## Suggested Data Model Scope

The Wellness Goals page may use mock data such as:

- Goal title
- Goal category
- Goal target
- Current progress
- Progress percentage
- Goal status
- Due date or period
- Priority
- Short insight message

---

## Suggested Goal Categories

The page may include goal categories such as:

- Activity
- Hydration
- Sleep
- Nutrition
- Mindfulness
- Checkups
- General wellness

---

## Out of Scope

Release 3 does not include:

- Backend integration
- Real database persistence
- User authentication
- Real wearable device integration
- Real-time goal synchronization
- Goal creation form with saved persistence
- Notification system
- Medical recommendation system

---

## Implementation Direction

The implementation should follow the existing BinarWell structure.

The page should be added as a clean extension, not as a rewrite of the existing dashboard.

The existing v1.0.0 and v1.1.0 functionality must remain protected.

---

## Documentation Requirement

Each stage should follow this structure:

1. Scope of the micro-gate
2. Files to create/update
3. Implementation
4. Run quality checks
5. Document changes
6. Gate decision
