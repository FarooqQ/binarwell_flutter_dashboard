# R2-012 Changelog

## Gate

R2-012 — Hourly Movement Chart Card

## Updated

- Replaced HourlyMovementChartCard placeholder with a real chart card
- Added Hourly Movement title
- Added Steps throughout the day subtitle
- Added visual Steps dropdown badge
- Added custom line and area chart
- Added hourly labels
- Used ActivityMockData.hourlyMovement as data source
- Added overflow-safe label handling

## Purpose

This gate implements the Hourly Movement chart as an Activity-specific daily tracking component.

## Data Source

The chart uses ActivityMockData.hourlyMovement.

## Notes

No external chart package was added.

The chart is implemented using CustomPainter to keep the project lightweight.


