## Main app features

This is a concise overview of the primary features implemented in the main app (`apps/not_zero_app`).

### Tasks

- Create, edit, view, and delete tasks
- Tasks persist locally via Drift/SQLite (`nz_drift`)
- Supports tags and sublists for organizing tasks
- Quick task creation from the home screen

### Tags & Sublists

- Define tags to group related tasks
- Build sublists for focused workflows

### Habits

- Create, edit, view, and delete recurring habits
- Track daily habit completions with recent history around the current date
- Habits persist locally via Drift/SQLite (`nz_drift`) and can be linked with tags
- Habit list UI supports compact and expanded layouts
- Habit events integrate with the app’s statistics and scoring system

### Daily check-in

- Daily “check in” flow that encourages opening the app regularly and building a streak
- On app open, shows a dialog to start/continue a streak (or notify about a lost streak)
- Each check-in awards points; the amount increases with longer streaks and is integrated into the total score/statistics

### Quick statistics

- Simple charts and counters (powered by `fl_chart`) to provide a quick view on progress

### Themes

- Light and dark theme support
- Dynamic color on supported platforms

### Settings

- About page and licenses
- Storage settings (data export/import)

### Backup and restore

- Export and import app data from **Settings → Storage**
- Backup is saved as a `.tar.gz` archive containing:
  - Drift/SQLite database (`db.sqlite`)
  - Key-value settings (`settings.json`)
  - Backup metadata (`backup_info.json`) and app metadata (`app_info.json`)
- Restore currently applies the database and settings from the archive

---

If you add a new feature, please:

1) Document it here with a short summary and key capabilities
2) Consider adding a dedicated section under your feature directory with deeper docs if needed
3) Keep the structure consistent with the app architecture described in `docs/architecture.md`
