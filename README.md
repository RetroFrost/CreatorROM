<h1 align="center">CreatorROM 4.0.0 Genesis</h1>

<p align="center">A Galaxy S10+ (Exynos) port based on ArtisanROM 3.5.1 and the UN1CA build system.</p>

## Status

CreatorROM 4.0.0 is an early bring-up for `beyond2lte` (`SM-G975F` and `SM-G975N`). It combines the current One UI 8 ArtisanROM/UN1CA base with the Exynos 9820 compatibility blobs, device overlays, and kernel integration previously used by ArtisanROM 3.1.1.

The first packages are engineering builds. Keep a complete backup and the matching stock firmware available before testing. Installation can erase data or make a device temporarily unbootable; never flash a package built for another model.

## Build

On Ubuntu 24.04:

```bash
git clone --recurse-submodules https://github.com/RetroFrost/CreatorROM.git
cd CreatorROM
git switch creatorrom-4.0.0
source buildenv.sh beyond2lte
./scripts/build_dependencies.sh
./scripts/download_fw.sh
./scripts/extract_fw.sh
./scripts/make_rom.sh
```

The GitHub Actions workflow performs the same build and publishes split ZIP parts to a draft GitHub release. Unofficial builds use the included AOSP test keys. Official release keys are never stored in the repository.

## Project lineage

CreatorROM preserves the original GPL licensing and credits. The modern base and most ROM features come from [ArtisanROM](https://github.com/ArtisanROM/ArtisanROM) and [UN1CA](https://github.com/salvogiangri/UN1CA). Exynos 9820 bring-up files were originally developed by the ArtisanROM/ExtremeROM contributors, including Android-Artisan, Salvo Giangreco, BlackMesa123, and the authors named in each module.

See [LICENSE](LICENSE), [CHANGELOG.md](CHANGELOG.md), and the per-module `module.prop` files for details.
