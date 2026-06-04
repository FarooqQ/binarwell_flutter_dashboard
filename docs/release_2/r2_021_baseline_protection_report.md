# R2-021 � Release Baseline Protection Report

## Gate

R2-021 � Release Baseline Protection & Version Delta Documentation

## Purpose

This gate documents the protection of the original public release baseline before preparing Release 2 for Git and GitHub publishing.

## Protected Baseline

BinarWell Flutter Dashboard v1.0.0 is treated as the first public baseline release.

This baseline should remain unchanged.

## Release 2 Target

BinarWell Flutter Dashboard v1.1.0

Release 2 theme:

Activity-First Multi-Page Expansion

## Baseline Protection Rules

The following rules apply:

- Do not overwrite the v1.0.0 release
- Do not delete the v1.0.0 tag
- Do not force-push over the v1.0.0 baseline
- Do not rewrite the first public release history
- Publish Release 2 as a new version, not as a replacement for Release 1

## Release 1 Position

Release 1 represents the original BinarWell Flutter Dashboard public release.

Its main focus was the polished wellness overview dashboard.

## Release 2 Position

Release 2 builds on top of Release 1 by adding:

- Multi-page navigation
- Activity page identity
- Activity visual components
- Activity mock data
- Responsive Activity layout
- Activity widget tests
- Release 2 documentation

## Decision

The v1.0.0 baseline is protected conceptually and should remain available as the first public release.

Release 2 should be published separately as v1.1.0.


