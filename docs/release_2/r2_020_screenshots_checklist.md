# R2-020 Screenshots Checklist

## Gate

R2-020 — README and Screenshots Update

## Screenshot Checklist

| Screenshot | Suggested File Name | Status |
|---|---|---|
| Activity page large desktop | activity_large_desktop.png | READY TO CAPTURE |
| Activity page medium desktop | activity_medium_desktop.png | READY TO CAPTURE |
| Activity page small window | activity_small_window.png | READY TO CAPTURE |
| Sidebar Activity active state | activity_sidebar_active.png | READY TO CAPTURE |
| Flutter analyze validation | validation_flutter_analyze.png | READY TO CAPTURE |
| Flutter test validation | validation_flutter_test.png | READY TO CAPTURE |

## Manual Capture Instructions

Run the app:

```powershell
flutter run -d windows
```

Capture the Activity page in three sizes:

- Large Desktop
- Medium Desktop
- Small Window

Save screenshots inside:

```text
docs/screenshots/release_2/
```

## Validation Screenshot Instructions

Run:

```powershell
flutter analyze
flutter test
```

Capture the terminal results only if needed for GitHub or portfolio evidence.

## Decision

The screenshot structure is ready.

Actual screenshots can be captured before GitHub release preparation.


