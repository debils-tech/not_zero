## Feature spec template

Fill out this template when creating or updating a feature in `apps/not_zero_app/lib/src/features/<feature>/`.

### 1. Summary

- Name:
- Short description (1–3 sentences):
- Primary user value:

### 2. Scope & non‑goals

- In scope:
- Out of scope:

### 3. Architecture

- Feature directory: `lib/src/features/<feature>/`
- Layers and components:
  - services:
  - repositories:
  - notifiers:
  - view:
  - models (optional):
  - utils (optional):
- Riverpod providers file: `di.dart`

### 4. Data model

- Entities and value objects (use `freezed` where appropriate):
- Serialization needs (`json_serializable`):
- Storage sources (Drift via `nz_drift`, key‑value via `nz_boxes`):

### 5. Navigation & routing

- Routes added/changed in `lib/src/routes.dart`:
- Deep linking considerations:

### 6. UI/UX

- Screens and states:
- Loading/empty/error states:
- Theming and accessibility:

### 7. Testing

- Unit tests (repositories, utils):
- Widget tests (notifiers, views):

### 8. Telemetry & logging

- What should be logged and why:

### 9. Migration

- Data migrations (Drift schema changes) if any:
- Backward compatibility notes:

### 10. Risks & open questions

- Risks:
- Open questions:

### 11. Tasks checklist

- [ ] Implement data layer (services)
- [ ] Implement business layer (repositories)
- [ ] Implement UI layer (notifiers/view)
- [ ] Wire up providers in `di.dart`
- [ ] Add/adjust routes
- [ ] Add tests
- [ ] Update `docs/features.md`
- [ ] Update screenshots (optional)
