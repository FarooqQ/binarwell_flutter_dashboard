# BW-RN-001-MG2 � Rename GitHub Repository and Remote URL

## Scope
Rename the GitHub repository and update the local Git remote URL from BinarWell identity to BinarWell identity.

## Repository rename
Old repository name:
BinarWell_flutter_dashboard

New repository name:
binarwell_flutter_dashboard

## Remote URL
Old remote:
https://github.com/FarooqQ/BinarWell_flutter_dashboard.git

New remote:
https://github.com/FarooqQ/binarwell_flutter_dashboard.git

## Verification
- git remote -v: PASSED
- git ls-remote origin -h refs/heads/main: PASSED
- git status: PASSED

## Notes
This micro-gate only renamed the GitHub repository and updated the local remote URL.
Flutter package name, app title, README content, and code references will be updated in later micro-gates.

## Gate decision
PASSED
