#!/usr/bin/env bash
# Copyright (c) 2026 RetroFrost
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

BASE_SCRIPT="$SRC_DIR/scripts/internal/build_flashable_zip_legacy_base.sh"
TMP_SCRIPT="$(mktemp)"

cleanup()
{
    rm -f "$TMP_SCRIPT"
}
trap cleanup EXIT INT

# Keep the proven 3.1.1 static-partition packager while applying CreatorROM branding.
sed 's/ArtisanROM/CreatorROM/g' "$BASE_SCRIPT" > "$TMP_SCRIPT"
chmod +x "$TMP_SCRIPT"
"$TMP_SCRIPT"
