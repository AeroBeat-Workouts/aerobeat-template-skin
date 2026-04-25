# AeroBeat Skin Template

UGC skins (visual replacements) for AeroBeat gameplay elements.

## 📋 Repository Details

*   **Type:** Skins (Art)
*   **License:** **CC BY-NC 4.0**
*   **Dependencies:**
    *   `aerobeat-asset-core` (Canonical shared asset/resource contract)
    *   `aerobeat-feature-*` (Consumer-selected runtime dependency; add the specific feature addon you are skinning when validating against a concrete gameplay package)

## GodotEnv development flow

This repo uses the AeroBeat GodotEnv asset-package convention.

- Canonical dev/test manifest: `.testbed/addons.jsonc`
- Installed dev/test addons: `.testbed/addons/`
- GodotEnv cache: `.testbed/.addons/`
- Hidden workbench project: `.testbed/project.godot`
- Repo-local unit tests: `.testbed/tests/`

The repo root remains the package/published boundary for downstream consumers. Day-to-day development, import checks, and validation happen from the hidden `.testbed/` workbench using the pinned OpenClaw toolchain: Godot `4.6.2 stable standard`.

### Restore dev/test dependencies

From the repo root:

```bash
cd .testbed
godotenv addons install
```

That restores this repo's current dev/test manifest into `.testbed/addons/`. Canonically, skins belong to the Asset lane and should describe their shared contract in terms of `aerobeat-asset-core`.

### Open the workbench

From the repo root:

```bash
godot --editor --path .testbed
```

Use this `.testbed/` project as the canonical direct-development and import-validation surface for skin work.

### Import smoke check

From the repo root:

```bash
godot --headless --path .testbed --import
```

### Run unit tests

From the repo root:

```bash
godot --headless --path .testbed --script addons/gut/gut_cmdln.gd \
  -gdir=res://tests \
  -ginclude_subdirs \
  -gexit
```

## 📂 Structure

*   `assets/gloves/` - Feature-specific glove or controller skin resources.
*   `assets/targets/` - Skinned target visuals.
*   `assets/obstacles/` - Skinned obstacle visuals and related resources.
*   `assets/trails/` - Optional trail visuals for the locked v1 gameplay-facing asset set.

## Validation notes

- `.testbed/addons.jsonc` is the committed dev/test dependency contract.
- The current manifest still pins the transition-era `aerobeat-core` package key to `v0.1.0` alongside GUT `main`. Canonical lane ownership is `aerobeat-asset-core`.
- Repo-local unit tests live under `.testbed/tests/`.
- This template is root-packaged (`subfolder: "/"`) and does not use a `.testbed/src` bridge. The committed manifest intentionally keeps only the transition-era shared core pin plus GUT; the feature addon remains an explicit consumer choice because this generic template cannot truthfully hard-code one feature contract for every downstream skin repo.
- The locked v1 gameplay-facing asset types are `gloves`, `targets`, `obstacles`, and `trails`. Coach-facing asset types belong in package coaching configuration, not this generic skin template.

## Notes

- When validating a real skin against a concrete feature, add that specific `aerobeat-feature-*` repo to `.testbed/addons.jsonc` rather than cloning it ad hoc into `addons/`.
- This preserves the GodotEnv contract while making the old manual feature dependency nuance explicit instead of implicit.
