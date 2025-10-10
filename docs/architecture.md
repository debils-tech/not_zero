## Architecture

This document explains the overall architecture of the Not Zero monorepo and the boundaries between app features and shared packages.

### Goals

- Modularity and clear separation of concerns
- Reuse of technical capabilities through internal packages
- Maintainable feature‑oriented organization in the main app

### Monorepo boundaries

- Main application: `apps/not_zero_app/`
  - Contains product features, presentation, composition, and app glue code
  - Owns navigation (`lib/src/routes.dart`) and entry point (`lib/main.dart`)
  - Features live under `lib/src/features/`
- Shared packages: `packages/`
  - Provide composable, reusable, and testable technical building blocks
  - Examples: `nz_drift` (SQLite/Drift), `nz_boxes` (key‑value storage), `nz_common` (utilities)

### Feature structure in the app

Each feature inside `lib/src/features/<feature>/` follows a Clean‑Architecture‑inspired structure:

- `services/` — data access layer. One service per data source (local/remote). Always stateless. Cannot be accessed by UI directly.
- `repositories/` — business logic layer. One repository per logical unit. Repositories should be as stateless as possible and must not store UI state.
- `notifiers/`, `view/` — UI layer. Notifiers hold UI state and orchestrate interactions with repositories. Views render UI.
- Optional:
  - `models/` — data models specific to the feature (UI state, DTOs between layers)
  - `utils/` — utility code used only by this feature
  - `di.dart` — Riverpod providers for wiring the feature

### State management and DI

- The project uses `flutter_riverpod`.
- Providers are typically declared in `di.dart` inside each feature.
- Notifiers expose immutable state objects (prefer `freezed` for modeling state).

### Data and storage

- Local database is implemented in `packages/nz_drift` using Drift/SQLite.
- Key‑value storage is implemented in `packages/nz_boxes` using Shared Preferences.
- App features consume these via repositories/services; UI never talks to storage directly.

### Routing and composition

- Routing is defined in `apps/not_zero_app/lib/src/routes.dart` using `go_router`.
- Features are composed at the app layer; repositories/services are provided via Riverpod.

### Code generation

- Use `freezed` + `json_serializable` and build via `build_runner`.
- Run workspace‑wide codegen with `dart run melos generate`.

### Conventions and rules

- One repository per logical unit; avoid “god” repositories that span many features.
- Services are stateless and focused on a single data source.
- UI never accesses services directly — always go through repositories/notifiers.
- Cross‑feature utilities should move into an appropriate package under `packages/`.
- Keep feature code self‑contained; only export what the app layer needs.

### Tooling

- Workspace configuration and Melos scripts live in the root `pubspec.yaml`.
- Pinned Flutter version is specified in `.fvmrc`.
- Build and packaging helpers are in the `Makefile` and `tools/`.
- CI lives in `.github/workflows/` and runs format, analyze, tests, and release flows.

### Read next

- `docs/features.md` — overview of the main app features
- `docs/feature_spec_template.md` — template for describing new/changed features
