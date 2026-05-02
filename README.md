# AeroBeat Internal Skin Template

This is the official template for creating **internal skin** repositories within the current AeroBeat v1 architecture.

It should be read against the locked product direction from `aerobeat-docs`:

- **Primary release target:** PC community first
- **Official v1 gameplay features:** Boxing and Flow
- **Official v1 gameplay input:** camera only
- **UI input stance:** mouse and touch remain valid for UI navigation, without implying equal-status gameplay input support
- **Asset-lane ownership:** shared internal skin contracts belong to the asset lane through `aerobeat-asset-core`
- **Downscoped customization truth:** this template is for internal/system skin work, not for reviving the older UGC or package-local gameplay skin swap story

## 📋 Repository Details

- **Type:** Internal skin template
- **License:** **CC BY-NC 4.0** (Attribution-NonCommercial)
- **Dependency contract:**
  - `aerobeat-asset-core` — required shared asset/resource contract for the asset lane
  - `aerobeat-feature-*` — optional consumer-selected runtime dependency when validating a concrete skin against a specific feature such as Boxing or Flow
  - additional adjacent lane/core repos only when a concrete internal skin repo truly consumes them

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

That restores this repo's current dev/test manifest into `.testbed/addons/`. Canonically, this template should keep the baseline manifest narrow: `aerobeat-asset-core` plus test-only tooling.

### Open the workbench

From the repo root:

```bash
godot --editor --path .testbed
```

Use this `.testbed/` project as the canonical direct-development and import-validation surface for internal skin work.

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

- `assets/gloves/` - Skinned glove or hand-target presentation assets for the retained v1 feature set.
- `assets/targets/` - Internal target presentation variants for concrete features such as Boxing or Flow.
- `assets/obstacles/` - Shared obstacle presentation variants that stay aligned with current feature contracts.
- `assets/trails/` - Optional trail and motion-accent visuals for gameplay-facing internal polish.

## Validation notes

- `.testbed/addons.jsonc` is the committed dev/test dependency contract.
- The canonical template manifest for this repo is `aerobeat-asset-core` + `gut`.
- Do **not** restore a universal `aerobeat-core` baseline here. Add a concrete `aerobeat-feature-*` repo only when a real downstream skin package needs feature-specific validation.
- Repo-local unit tests live under `.testbed/tests/` and currently validate repo metadata plus the manifest contract.
- This template is root-packaged (`subfolder: "/"`) and does not use a `.testbed/src` bridge; add real content directly under the repo root package boundary.
- Coach-facing asset surfaces belong in coaching/content lanes, not this generic skin template.

## Notes

- These skins are intended for internal AeroBeat assemblies and controlled product presentation surfaces.
- Boxing and Flow are the retained gameplay-facing examples for current v1 truth; non-retained feature examples should not be taught as baseline template scope.
- Keep feature-specific runtime dependencies explicit and selective rather than pretending one universal feature baseline fits every skin repo.
