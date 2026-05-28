# R2-004 Changelog

## Gate

R2-004 — DashboardShell Page Switching

## Updated

- Converted DashboardShell from StatelessWidget to StatefulWidget
- Added selected page state inside DashboardShell
- Connected WellnessSidebar selectedPage to DashboardShell state
- Connected WellnessSidebar onPageSelected callback to DashboardShell
- Updated DashboardMainArea to receive selectedPage
- Added temporary page switching placeholders
- Preserved the existing Overview dashboard content

## Purpose

This gate makes DashboardShell responsible for switching dashboard pages while keeping the sidebar stable.

## Notes

The Activity page is not fully implemented in this gate.

The Activity page currently appears as a placeholder and will be implemented in later Release 2 gates.

