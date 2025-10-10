## TL;DR by human

It is a Flutter project with multiple packages that it uses. Main app is stored in `apps/not_zero_app/`. Different packages are stored in `packages/`. Packages - are the way to split logic and make app more modular, however features itself are implemented directly in the main flutter app itself (@features/ dir contains them)
Since project is monorepo, it is managed with melos and dart workspaces. Configuration is placed in  `pubspec.yaml`. Also current supported flutter version is placed in @.fvmrc and regularly updated, usually the latest flutter version is specified here
Some building scripts are stored in @Makefile , @tools/ and @workflows/

Because the goal is make app more modular and universal, most of the independant technical features are presented in different packages in @packages/

In the main flutter app layout looks like this:
- `constants/` just for app-wide constants
- `features/` for independant logical/business features
- `helpers/` for some random app-wide utils

App uses go_router and routing is described in `routes.dart`. App entrypoint is `lib/main.dart`
App uses riverpod for DI and state management. Providers are usually defined in `di.dart` file in each feature
Models and dataclasses are usually generated with **freezed**+**json_annotations** and built with build_runner
Local database is drift and all the tables and db code is written in `nz_drift` package. For key-value storage app uses shared-prefs and its universal logic is written in `nz_boxes` package

Architecture is inspired by "Clean architecture" from Robert Martin, althrough architecture like this is usual thing for flutter apps and maybe even most of the mobile apps at all

Each feature is split into several layers:
- `services` - data layer. Services can be local and remote. 1 service for 1 data source. Services are always stateless. Can be accessed from business layer, but absolutely can't accessed from UI
- `repositories` - business layer. 1 repository for 1 logical unit. There shouldn't be 1 repository that covers multiple features or that does everything everywhere at once. Repositories can be statefull, but they should be as stateless as possible and shouldn't store UI states, althrough UI can interact with them in certain ways
- `notifiers`, `view` - UI layer. Notifier  entity that can store UI state and interact with business logic
accompanied by several other directories that may or may not be in the feature:
- `utils` - separated helpful utilities exclusive for the feature
- `models` - when it is better to pass some model, state or data class between layers, it should be placed here. Here can be UI state, models for business layer and other things

## Not Zero — Project documentation

> **⚠️ Most of this documentation is written by AI and for AI. I am sorry for this, but it was written by instructing it with much more simple docs that I could write in 10 minutes**
>
> Some documentation is better than no documentation anyway 🤷‍♂️

Not Zero is a free and open source, cross‑platform Flutter application that motivates people to complete everyday tasks using gamification. This repository is a monorepo that contains the main Flutter app and a set of reusable Dart/Flutter packages.

### Monorepo layout

- `apps/not_zero_app/`: main Flutter application
  - Entry point: `lib/main.dart`
  - Routing: `lib/src/routes.dart` (using `go_router`)
  - Features: `lib/src/features/` (business/UI features live here)
  - Constants: `lib/src/constants/`
  - Helpers: `lib/src/helpers/`
  - Assets and platform folders live in this app directory
- `packages/`: shared, reusable packages providing technical capabilities
  - `nz_drift/`: local database (Drift/SQLite), schemas and migrations
  - `nz_boxes/`: key‑value storage abstraction (Shared Preferences)
  - `nz_base_models/`: base models used across the workspace
  - `nz_common/`: cross‑cutting pure Dart utilities
  - `nz_flutter_core/`: Flutter‑specific cross‑cutting utilities and l10n assets
  - `nz_logger/`: logging utilities
- Tooling and CI
  - `pubspec.yaml` (workspace root): Melos/Dart workspace configuration and scripts
  - `.fvmrc`: pinned Flutter version to use locally
  - `Makefile` and `tools/`: build and release helper scripts
  - `.github/workflows/`: CI for checks and release

### Tech stack

- Flutter + Dart monorepo managed by Melos (Dart workspaces)
- Navigation: `go_router`
- State management and DI: `flutter_riverpod`
- Code generation: `freezed` + `json_serializable` (via `build_runner`)
- Local storage: Drift (SQLite) in `nz_drift`, key‑value in `nz_boxes`

### Architecture (high‑level)

The app follows a pragmatic, Clean‑Architecture‑inspired structure:

- Feature modules live in `apps/not_zero_app/lib/src/features/<feature>/`
- Each feature is split into layers:
  - `services/` — data source access (local/remote), stateless
  - `repositories/` — business logic per logical unit, minimal state
  - `notifiers/`, `view/` — UI state and presentation
  - optional `models/`, `utils/`
- Riverpod providers are typically declared in the feature `di.dart`

See `docs/architecture.md` for the full set of rules and boundaries.

### Getting started

1) Install Flutter and ensure the version in `.fvmrc` is used locally (FVM recommended).
   - See the [FVM Getting Started Guide](https://fvm.app/documentation/getting-started/installation).

```bash
fvm install
```

2) Bootstrap the workspace:
   - More info: [Melos Getting Started](https://melos.invertase.dev/getting-started/)

```bash
dart run melos bootstrap
```

3) Run the app:

```bash
cd apps/not_zero_app
flutter run
```

### Common scripts

- Generate code (freezed/json):

```bash
dart run melos generate
```

- Format, analyze, and test:

```bash
dart run melos format --set-exit-if-changed --output none $(git ls-files | grep --colour=never -e ".*\.dart")
dart run melos exec flutter analyze --no-fatal-infos
dart run melos run --no-select test
```

- Build artifacts (examples):

```bash
make build-android
make build-linux
```

### Features

An overview of the main app features lives in `docs/features.md`.

### Contributing and new feature specs

When adding new features or altering existing ones, please follow the feature spec template in `docs/feature_spec_template.md`, and update `docs/features.md` accordingly.
