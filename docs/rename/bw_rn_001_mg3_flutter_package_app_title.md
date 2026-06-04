# BW-RN-001-MG3 — Rename Flutter Package and App Title

## Scope
Rename the Flutter technical identity from CarePulse to BinarWell.

## Updated items
- Flutter package name updated to binarwell_flutter_dashboard
- Main app identity updated to BinarWell
- Dashboard page identity updated to BinarWell
- Mock data identity updated to BinarWell
- Navigation enum/page identity updated to BinarWell
- Dart imports updated
- Tests updated to use the new package identity

## Quality checks
- flutter analyze: PASSED
- flutter test: PASSED

## Notes
This micro-gate focused on stabilizing the Flutter project after the rename.
Some documentation and public identity references may already be changed by the rename sweep and will be reviewed in the next documentation cleanup gate.

## Gate decision
PASSED
