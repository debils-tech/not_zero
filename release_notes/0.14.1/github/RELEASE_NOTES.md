> ⚠️ This update is experimental and some features may not work as expected, only some platforms were tested

> **0.14.0 broke android build number for split abi builds (armv8 for example). Android can't properly update the app if new version's build number is lower than the current one**
> For proper updating from 0.13 to 0.14, there you should:
>
> 1. Update your app to version 0.13.3 [(release on GitHub)](https://github.com/debils-tech/not_zero/releases/tag/0.13.3)
> 2. Backup your data
> 3. Uninstall Not Zero
> 4. Install Not Zero version 0.14.1
> 5. Restore your data from the backup file

## New features

- **Daily check in**. Open "Not Zero" every day and earn points! More points are gained longer your streak
- **Backups**. You can now backup and restore data. Can be usefull if app's data needs to be transfered to some devices
- Added translation to russian language _(couldn't add it since it is my native language)_
- Added simple special effects! Now there is a burst on confetti when you complete a task or a habit
- Some UI improvements in general

## Bugfixes

- You can change task to "Someday" now after a date was specified
- Filter of someday tasks was a bit buggy, now it works always fine
