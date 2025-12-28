> ⚠️ This update is experimental and some features may not work as expected, only some platforms were tested

> **0.14.0 broke android build number for split abi builds (armv8 for example). Android can't properly update the app if new version's build number is lower than the current one**
> For proper updating from 0.13 to 0.14, there you should:
>
> 1. Update your app to version 0.13.3 [(release on GitHub)](https://github.com/debils-tech/not_zero/releases/tag/0.13.3)
> 2. Backup your data
> 3. Uninstall Not Zero
> 4. Install Not Zero version 0.14.2
> 5. Restore your data from the backup file

## Bugfixes

- "Someday" tasks used today as fallback when editing
- Check in dialog has 1 day of
