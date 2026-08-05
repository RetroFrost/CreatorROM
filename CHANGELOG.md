# CreatorROM changelog

## 4.0.0 — in development

- Fork the current ArtisanROM 3.5.1 / `sixteen` source as CreatorROM.
- Set the project version and codename to CreatorROM 4.0.0 `Creator`.
- Begin restoring Galaxy S10+ Exynos (`beyond2lte`) support.
- Import the last ArtisanROM v3.1.1 Exynos 9820 platform and `beyond2lte` target trees as migration references.
- Convert the Galaxy S10+ target configuration to the current UN1CA schema.
- Add a current-schema Exynos 9820 platform configuration.
- Declare the Galaxy S10 legacy non-super partition layout.
- Add automated source/configuration validation for the port branch.
- Document remaining installer, kernel, boot-chain, full-build, and device-testing blockers.

> This release is not yet build- or flash-ready. The entries below are inherited upstream history.

# ArtisanROM upstream history

# 3.5.0
- Switch to UN1CA build system (thx @xfwdrev).
- Switch to S22 firmware.
- Updated base firmware to S22 May Security Patch.
- Fix Screen Recording.
- Fix Dynamic Resolution.
- Fix Adaptive color tone.
- Add SUSFS to Kernel (thx @miguelito).
- Revamp Updater app.
- Fix issue where some settings would not be saved after reboot.
- Remove custom ringtones due to the S22 not supporting OTF Audio (On The Fly).
- Fix LED Cover Case.
- Enforce EROFS.
- Fix issue where download would be deleted if app is closed.
- Add incremental updates support (starting next release, updates will be lighter).
- Remove S10 support
- Add lk3rd Bootloader to ROM
- Add Option to reboot to lk3rd in UN1CA settings
- Improve CPU scheduler (longer battery life).
- Fix FRP
- Fix Modes and Routines crash
- Fix editing Motion photos causes crash
- Fix Fingerprint Icon on lock screen
- Fix monotype fonts not working
- Reduce Boot Time by 12 seconds

# 3.1.1
- Fix Bluetooth on 9820 (thx @dupazlasu/@milxnaq)
- Update kernels to KSU Next v3.2.0
- Debloat SamsungTTS completely.
- Keep EroFS Partitions

# 3.1.0
- Add S10 Series (Exynos9820)
- Add Custom ExtremeROM Ringtones and Startup/Shutdown sounds (thx @Ronan & Lindir Music)
- Update KernelSU-Next version to 3.1.0 (thx @Mesazane)
- Fix Boot Animation
- Fix 120hz refresh rate
- Add Software Update button in Settings app to directly open the Updater App (thx @salvogiangri)
- Add ArtisanROM Settings in Updater app (NEW Settings screen to turn features on or off.)
- Add Vulkan Rendering (Experimental) (thx @salvogiangri)
- Switch to EXT4
- Update Viper4Android to latest
- Fix Termux Crash on all 990 devices
- Updated base firmware to S25 FE March Security Patch
- Add Unlimited Google Photos storage spoof (thx @salvogiangri)
- Rebrand to ArtisanROM
- Start to sign Official Releases
- Remove LED case support
- Debloat all SamsungTTS

# 3.0.7
- Fix USB Audio
- Add Multi User Support
- Fix Screen Record

# 3.0.6
- This update was made possible thx to @Ghasemzadehfard-Dev
- Fix SvstemUI crash on r8s (thx @GhasemzadehFard-Dev)
- Fix Termux Crash on r8s (thx @chasemzadehFard-Dev)
- Add RAM Plus fully to r8s (thx @GhasemzadehFard-Dev)
- Add S26U fake device image
- Updated base firmware to S25 FE February Security Patch

# 3.0.5
- Add Viper4Android
- Add more apps to debloat
- Fix RAM Plus (thx @GhasemzadehFard-Dev)
- Fix termux reboot on kill (thx @GhasemzadehFard-Dev)
- Fix Face Recognition on r8s (thx @GhasemzadehFard-Dev)
- Bypass CSC and fix Hiya (thx @GhasemzadehFard-Dev)
- Keep optics and prism EXT4 (thx @GhasemzadehFard-Dev)
- This update would not be possible without @GhasemzadehFard-Dev

# 3.0.1
- Fixed reboot on call end (thx @GhasemzadehFard-Dev)
- Add logo and fix bugs in the updater app
- Add and enable native smart call and hiya globally throughout the ROM
