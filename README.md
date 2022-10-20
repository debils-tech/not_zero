# <img src="assets/logo-colored.svg" width="27"> **Not Zero**

<a href="./LICENSE.md"><img src="https://img.shields.io/badge/license-GPLv3-blue.svg"></a>

> Currently under active development and doesn't have anything very intresting to show.
>
> More information will be in the near future.

Not Zero is a free crossplatform application developed with [flutter](https://flutter.dev) that aims to motivate people to do everyday tasks using gamification.

## Project status and roadmap

Project is now developing by the single person, so development is not very fast.
It currently at very early stage, I would like to call it **alpha**, but it is more like **pre-alpha**.

Here is roadmap of project and what features are necessary to "complete" each stage:

<details>
<summary> Alpha </summary>

- [x] Stable app's architecture
- [x] Home screen
- [x] Tasks (and local storage for them)
- [x] "About" screen
- [x] Light and dark themes
- [x] App branding (logo, icons, posters)
- [ ] Stable database version
- [ ] Automatic builds and basic packaging `(in progress)`
- [ ] Notes
- [ ] Export and import of app's data
</details>

<details>
<summary> Beta </summary>

- [ ] Animations
- [ ] Advanved stats (weekly, monthly statistics)
- [ ] Release in Google Play
- [ ] Release in F-Droid
- [ ] Combos
- [ ] Habbits
</details>

<details>
<summary> Stable release </summary>

- [ ] Achievements
- [ ] Adaptation for iOS
- [ ] Release in App Store
- [ ] Adaptation of app for desktop
- [ ] Release on Linux
- [ ] Release on Windows
</details>

## Building and running

```bash
# For installing basic dependencies, configuring flutter version, generating neccesary code
# Make sure you added "$HOME/.pub-cache/bin" to your PATH because it is necessary for FVM
make config

# Run flutter app to any available device using already configured flutter version
make run

# Run app tests
make test
```
