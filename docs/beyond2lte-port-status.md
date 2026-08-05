# CreatorROM 4.0.0 — Galaxy S10+ (`beyond2lte`) port status

> **Do not flash this branch yet.** It is an active migration branch and has not produced a boot-tested package.

## Goal

Bring Galaxy S10+ Exynos support back on top of the current ArtisanROM/UN1CA-based source tree as CreatorROM 4.0.0.

## Source baseline

- Current base branch: `sixteen` (ArtisanROM 3.5.1 development tree)
- Legacy S10 reference: ArtisanROM v3.1.1
- Target device: Samsung Galaxy S10+ Exynos (`beyond2lte`)
- Supported model assertions: `SM-G975F`, `SM-G975N`
- Platform: Exynos 9820

## Completed

- Created the isolated `creatorrom-4.0-beyond2lte` development branch.
- Restored the complete legacy `platform/exynos9820` migration tree from ArtisanROM v3.1.1.
- Restored the complete legacy `target/beyond2lte` migration tree, including overlays, camera data, patches, floating features, and the old post-install script.
- Converted the device configuration to the current UN1CA variable schema.
- Added a current-schema Exynos 9820 platform configuration.
- Declared the legacy non-super partition layout and `/dev/block/by-name` boot-device path.
- Set the project version to CreatorROM 4.0.0 (`Creator`).
- Added a GitHub Actions validator for shell syntax, generated configuration, and required migration assets.

## Remaining blockers

1. Replace the legacy `postinstall.edify` path with the current installer structure.
2. Add and verify a Galaxy S10 recovery fstab for the current installer.
3. Integrate a compatible Exynos 9820 kernel, DTBO, recovery/boot packaging, and required AVB handling.
4. Audit old binary patches against the current S22/One UI source firmware; outdated binaries cannot be assumed compatible.
5. Run firmware download/extraction and the complete ROM build pipeline.
6. Inspect the generated package before flashing.
7. Boot-test on `beyond2lte`, then validate radio, Wi-Fi, Bluetooth, audio, cameras, fingerprint, encryption, charging, and recovery installation.

## Validation policy

A target appearing in `source buildenv.sh` does not mean the ROM is flashable. CreatorROM will not be marked ready until configuration validation, a full package build, package inspection, and physical-device testing have all passed.

## Planned implementation order

1. Configuration generation
2. Installer and partition layout
3. Kernel and boot chain
4. Full build
5. Package inspection
6. Device testing and fixes
