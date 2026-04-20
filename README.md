# AeroBeat Skin Template

UGC skins (visual replacements) for AeroBeat gameplay elements.

## 📋 Repository Details

*   **Type:** Skins (Art)
*   **License:** **CC BY-NC 4.0**
*   **Dependencies:**
    *   `aerobeat-core` (Required foundation for shared skin/resource contracts)
    *   `aerobeat-feature-*` (Consumer-selected dependency; add the specific feature addon you are skinning to the workbench when validating against a concrete gameplay package)

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

That installs the pinned `aerobeat-core` foundation plus GUT into `.testbed/addons/`.

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

## Validation notes

- `.testbed/addons.jsonc` is the committed dev/test dependency contract.
- The manifest pins `aerobeat-core` to `v0.1.0` and GUT to `main`.
- Repo-local unit tests live under `.testbed/tests/`.
- This template is root-packaged (`subfolder: "/"`) and does not use a `.testbed/src` bridge. The committed manifest intentionally pins only `aerobeat-core`; the feature addon remains an explicit consumer choice because this generic template cannot truthfully hard-code one feature contract for every downstream skin repo.

## Notes

- When validating a real skin against a concrete feature, add that specific `aerobeat-feature-*` repo to `.testbed/addons.jsonc` rather than cloning it ad hoc into `addons/`.
- This preserves the GodotEnv contract while making the old manual feature dependency nuance explicit instead of implicit.
