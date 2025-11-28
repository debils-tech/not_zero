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

### Quick statistics

- Simple charts and counters (powered by `fl_chart`) to provide a quick view on progress

### Themes

- Light and dark theme support
- Dynamic color on supported platforms

### Settings

- About page and licenses
- Storage settings

### Backup and restore

- Export and import app data (Linux requires a dialog helper such as `zenity`, `qarma`, or `kdialog`)

---

If you add a new feature, please:

1) Document it here with a short summary and key capabilities
2) Consider adding a dedicated section under your feature directory with deeper docs if needed
3) Keep the structure consistent with the app architecture described in `docs/architecture.md`
