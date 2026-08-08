# Codex task: One UI 9 / Android 17 bring-up for beyond2lte

## Goal

Bring up Samsung One UI 9 / Android 17 on the Exynos Galaxy S10+ (`beyond2lte`, SM-G975F/SM-G975N) on this branch.

Read `/AGENTS.md` before making changes. Its donor/target separation and device-integrity constraints are mandatory.

## First task

1. Map the current CreatorROM/UN1CA firmware flow, especially how source/donor firmware differs from target firmware.
2. Inspect `buildenv.sh`, `scripts/`, `unica/`, `platform/exynos9820/`, and `target/beyond2lte/`.
3. Compare `beyond2lte` with the newest working target implementations to identify the current configuration schema.
4. Determine where a One UI 9 / Android 17 donor must be configured.
5. Do not invent a donor model firmware build, CSC, URL, or Android security patch level. If exact current firmware data cannot be verified in the environment, create an explicit configuration placeholder/TODO and document exactly what must be supplied.
6. Add the minimum Android 17 / One UI 9 scaffolding required by the existing build system without replacing S10+ hardware-facing components.
7. Keep the existing S10+ target firmware, bootloader, modem, EFS, Exynos 9820 boot chain/kernel, vendor/HALs, and partition assumptions authoritative unless a narrowly-scoped compatibility change is proven necessary.
8. Keep S10+ hardware capability declarations truthful. Do not globally spoof the phone as the donor.
9. Extend validation for every changed shell/config path.
10. Run source-only validation and fix every deterministic failure you can reproduce.

## Deliverables for the first Codex pass

- A documented map of donor-vs-target configuration in this codebase.
- One UI 9 donor configuration plumbing that follows existing UN1CA conventions.
- Any necessary Android 17 metadata/schema migrations that can be proven from the tree.
- Source-only tests/validation passing.
- A concise list of remaining blockers requiring real Samsung firmware, network access, signing inputs, or physical S10+ logs.

## Acceptance checks

At minimum:

```bash
bash -n buildenv.sh
bash -n target/beyond2lte/config.sh
bash -n target/beyond2lte/sff.sh
bash -n platform/exynos9820/config.sh
source ./buildenv.sh beyond2lte
```

Then verify:

```bash
test "$TARGET_CODENAME" = "beyond2lte"
test "$TARGET_PLATFORM" = "exynos9820"
test "$TARGET_SUPER_PARTITION_SIZE" = "0"
test "$TARGET_SUPER_GROUP_NAME" = "none"
```

Do not call the ROM bootable, stable, or flash-ready from source validation alone.

## Next task after configuration is correct

Make donor + target firmware download/extraction work for the verified One UI 9 donor, then attempt the manual `Build One UI 9 beyond2lte` workflow. Preserve exact failure logs and fix the earliest reproducible failure before moving to later bring-up problems.
