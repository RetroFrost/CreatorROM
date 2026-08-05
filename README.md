# CreatorROM

[![License](https://img.shields.io/github/license/RetroFrost/CreatorROM?style=for-the-badge&logo=github)](LICENSE)
[![Last commit](https://img.shields.io/github/last-commit/RetroFrost/CreatorROM/creatorrom-4.0-beyond2lte?style=for-the-badge)](https://github.com/RetroFrost/CreatorROM/commits/creatorrom-4.0-beyond2lte)
[![Port validation](https://img.shields.io/github/actions/workflow/status/RetroFrost/CreatorROM/validate-beyond2lte.yml?branch=creatorrom-4.0-beyond2lte&style=for-the-badge&label=beyond2lte%20validation)](https://github.com/RetroFrost/CreatorROM/actions/workflows/validate-beyond2lte.yml)

CreatorROM 4.0.0 is a work-in-progress Samsung One UI custom firmware project based on ArtisanROM and the UN1CA build system.

> **Development status:** the Galaxy S10+ Exynos (`beyond2lte`) port is not ready to flash. The current branch validates its source configuration, but it has not completed a full ROM build or physical-device test.

## Current target

- Device: Samsung Galaxy S10+ Exynos
- Codename: `beyond2lte`
- Models: `SM-G975F`, `SM-G975N`
- Platform: Exynos 9820
- Development branch: [`creatorrom-4.0-beyond2lte`](https://github.com/RetroFrost/CreatorROM/tree/creatorrom-4.0-beyond2lte)
- Detailed status: [`docs/beyond2lte-port-status.md`](docs/beyond2lte-port-status.md)

## What has been restored

The current ArtisanROM 3.5.x tree no longer carries Galaxy S10 support. CreatorROM restores the last ArtisanROM Exynos 9820 platform and `beyond2lte` device assets from v3.1.1, then migrates their configuration to the current UN1CA schema.

This includes the old device overlays, camera data, floating features, platform patches, and target-specific patches. These files are migration references, not proof that their binaries remain compatible with the newer source firmware.

## Planned build flow

```bash
source buildenv.sh beyond2lte
unica download_fw
unica extract_fw
unica make_rom
```

The full build flow should not be run as a release build until the legacy installer, partition layout, kernel, DTBO, recovery, and AVB handling have been migrated and reviewed.

## Upstream features

CreatorROM inherits the current ArtisanROM/UN1CA feature base, including One UI enhancements, Galaxy AI integrations, EROFS support, KnoxPatch, BluetoothLibraryPatcher, Play Integrity tooling, and UN1CA settings. Availability on `beyond2lte` depends on successful porting and device testing.

## Licensing

This project is licensed under the [GNU General Public License v3.0](LICENSE). External dependencies retain their respective licences.

## Credits

CreatorROM is a fork and continuation of work by:

- [ArtisanROM](https://github.com/ArtisanROM/ArtisanROM), for the firmware project and its previous Galaxy S10 implementation.
- [UN1CA](https://github.com/salvogiangri/UN1CA), by Salvo Giangreco, for the build system and One UI porting framework.
- The original ArtisanROM, UN1CA, Exynos 9820, kernel, patch, and testing contributors whose work remains credited in the repository history and upstream project.
- Dupazlasu and Milxnaq for previous Galaxy S10 Bluetooth work documented by ArtisanROM.

CreatorROM does not claim ownership of imported upstream work. New project-specific changes are tracked separately in this repository.
