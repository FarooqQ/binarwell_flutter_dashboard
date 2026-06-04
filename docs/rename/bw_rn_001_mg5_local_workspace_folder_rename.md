# BW-RN-001-MG5 — Local Workspace Folder Rename

## Scope
Rename the local development workspace folder from the previous project folder name to the new BinarWell project folder name.

## Local folder rename
Old local folder:
carepulse_flutter_dashboard

New local folder:
binarwell_flutter_dashboard

## Verification
- git remote -v: PASSED
- git status: PASSED
- flutter analyze: PASSED
- flutter test: PASSED

## Notes
This change affects only the local development path.
The GitHub repository and Flutter package identity were already renamed in previous micro-gates.

## Gate decision
PASSED
