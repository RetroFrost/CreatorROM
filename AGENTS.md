# Codex instructions — One UI 9 / Android 17 on beyond2lte

## Mission

Port Samsung One UI 9 / Android 17 to the Exynos Galaxy S10+ (`beyond2lte`, SM-G975F/SM-G975N) using the existing CreatorROM / ArtisanROM / UN1CA tree.

This branch is a bring-up branch. Do not claim the ROM boots or is flashable unless a real build and physical-device test prove it.

## Existing baseline

- Start from the restored `beyond2lte` work already present in this branch.
- Target SoC: Exynos 9820.
- Target Android vendor baseline currently declares API/VNDK 31 in `target/beyond2lte/config.sh`.
- The target uses the legacy/non-super layout currently represented by `TARGET_SUPER_PARTITION_SIZE=0` and `TARGET_SUPER_GROUP_NAME="none"`.
- Preserve the existing device overlays, target patches, SFF logic, installer work, and Exynos 9820 platform work unless there is concrete evidence a change is required.

## Port architecture

Treat this as a framework/userspace port, not a donor-device transplant.

One UI 9 donor side should provide, as supported by the UN1CA schema and compatibility work:

- Android 17 framework/userspace
- Samsung framework and services
- SystemUI, Settings, One UI Home, and Samsung apps
- donor `system`, `product`, and `system_ext` content where the build system expects it

The Galaxy S10+ side must remain authoritative for hardware-facing pieces, including:

- bootloader
- modem / CP
- EFS / radio identity data
- Exynos 9820 kernel and boot chain
- device DT/DTBO unless a target-specific compatible replacement is deliberately produced
- S10+ vendor/HALs and proprietary hardware blobs, with only narrowly-scoped compatibility shims/backports where required
- camera, graphics, audio, sensors, fingerprint, NFC, Wi-Fi/Bluetooth and radio hardware interfaces

Never copy or flash donor bootloader, modem, EFS, kernel, `vendor_boot`, DTBO, or hardware-specific vendor blobs just because they exist in the donor firmware.

## Donor rules

- Do not invent a Samsung firmware build number, CSC, model, download URL, or security-patch level.
- Keep donor selection isolated/configurable rather than scattering model/build strings through scripts.
- Before choosing a donor, inspect the current build-system schema and existing source-device targets in this repository.
- Prefer a non-foldable Exynos One UI 9 donor compatible with the current UN1CA pipeline when one is available and verifiable.
- If internet access is unavailable, leave donor identifiers as an explicit TODO instead of fabricating values.
- Never commit proprietary Samsung firmware images or extracted proprietary blobs that the repository does not already intentionally track.

## Work in milestones

### M0 — understand the tree

1. Map `buildenv.sh`, `scripts/`, `unica/`, `platform/exynos9820/`, and `target/beyond2lte/`.
2. Identify how the current branch distinguishes source/donor firmware from target firmware.
3. Compare `beyond2lte` with the newest working target(s) to learn the current schema.
4. Document incompatibilities before large edits.

### M1 — make configuration Android-17-ready

1. Add/configure the One UI 9 donor using existing UN1CA conventions.
2. Keep `TARGET_FIRMWARE` as the S10+ target firmware unless the schema proves otherwise.
3. Add the minimum Android 17 compatibility metadata required by the build system.
4. Preserve truthful S10+ hardware capability flags. Do not globally spoof the S10+ as the donor device.
5. Keep foldable-only features disabled unless the chosen donor is non-foldable or the feature is explicitly stripped.

### M2 — extraction and patch pipeline

1. Make donor and target firmware download/extraction paths deterministic.
2. Ensure target vendor/HAL content is retained.
3. Port framework/services patches forward only when needed.
4. Prefer small, reviewable patches over broad binary replacement.
5. Add diagnostics for VINTF/VNDK, linker, SELinux, framework/service, and partition-layout failures.

### M3 — buildability

1. Get dependency/config validation passing.
2. Get firmware download and extraction stages passing where network/secrets permit.
3. Get `make_rom.sh --debug` to produce an installable package without pretending device boot is proven.
4. Preserve logs as CI artifacts.

### M4 — physical-device bring-up

A human tester is required for this milestone. Prioritize:

1. kernel/init/partition mounts
2. ADB
3. SurfaceFlinger/display/touch
4. zygote/system_server/SystemUI/launcher
5. Wi-Fi and radio/RIL
6. audio/Bluetooth/sensors/GPS
7. fingerprint
8. camera
9. NFC/USB/DeX and optional Samsung features

Use `adb logcat -b all`, kernel logs, linker errors, VINTF errors, service crashes, and SELinux AVCs as evidence. Do not fix boot by adding blanket SELinux allow rules.

## Safety / device-integrity constraints

- Never add commands that wipe or modify EFS.
- Never package donor BL/CP/EFS for the S10+.
- Never make CI or scripts auto-flash a physical device.
- Keep AVB/recovery/installer/partition changes target-specific and reviewable.
- Do not mark releases stable based solely on compilation.

## Validation

For source-only changes, run at minimum:

```bash
bash -n buildenv.sh
bash -n target/beyond2lte/config.sh
bash -n target/beyond2lte/sff.sh
```

Also syntax-check every modified shell script.

If the UN1CA config can be generated without downloading firmware, run:

```bash
source ./buildenv.sh beyond2lte
```

and verify at least:

```bash
test "$TARGET_CODENAME" = "beyond2lte"
test "$TARGET_PLATFORM" = "exynos9820"
test "$TARGET_SUPER_PARTITION_SIZE" = "0"
test "$TARGET_SUPER_GROUP_NAME" = "none"
```

Run a full firmware build only when the environment has enough disk/RAM, required submodules, network access, and any required signing inputs. A failed full build is useful evidence; preserve the exact failing stage and logs.

## Commit discipline

- Keep commits scoped by milestone/problem.
- Explain compatibility assumptions in commit messages or docs.
- Do not silently delete inherited target patches because they look old; prove they are obsolete first.
- When a fix is uncertain, document the uncertainty and leave a testable next step.
