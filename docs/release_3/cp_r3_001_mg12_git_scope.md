# CP-R3-001-MG12 Git Scope

## Purpose

This document separates Release 3 changes from unrelated repository changes before GitHub publishing.

## Release 3 Files

The following paths belong to Release 3:

```text
README.md
docs/release_3/
docs/screenshots/release_3/
lib/features/dashboard/layout/dashboard_main_area.dart
lib/features/dashboard/layout/dashboard_shell.dart
lib/features/dashboard/layout/wellness_sidebar.dart
lib/features/wellness_goals/
test/features/wellness_goals/

Files Requiring Review Before Commit

The following files are currently modified or untracked but may not belong to Release 3:

.gitignore
docs/release_2/r2_025_github_release_notes_v1_1_0.md
docs/portfolio/cp_port_001/
Recommendation

Do not include unrelated files in the Release 3 commit unless they are intentionally part of this release.

Suggested Release 3 Add Command
git add README.md docs/release_3 docs/screenshots/release_3 lib/features/dashboard/layout/dashboard_main_area.dart lib/features/dashboard/layout/dashboard_shell.dart lib/features/dashboard/layout/wellness_sidebar.dart lib/features/wellness_goals test/features/wellness_goals
Suggested Commit Command
git commit -m "Release v1.2.0: add Wellness Goals dashboard page"
Suggested Tag Command
git tag v1.2.0
Suggested Push Commands
git push origin main
git push origin v1.2.0
Important

Do not run commit, tag, or push until the final approval file is created.

