# Copyright (c) 2026 RetroFrost
# SPDX-License-Identifier: GPL-3.0-or-later

# Compatibility helpers used only by legacy non-super devices.
if [[ "${TARGET_SUPER_PARTITION_SIZE:-1}" == "0" ]]; then
    IS_VALID_PARTITION_NAME()
    {
        local PARTITION="$1"
        [[ "$PARTITION" == "system" ]] || [[ "$PARTITION" == "vendor" ]] || \
            [[ "$PARTITION" == "product" ]] || [[ "$PARTITION" == "system_ext" ]] || \
            [[ "$PARTITION" == "odm" ]] || [[ "$PARTITION" == "vendor_dlkm" ]] || \
            [[ "$PARTITION" == "odm_dlkm" ]] || [[ "$PARTITION" == "system_dlkm" ]] || \
            [[ "$PARTITION" == "optics" ]] || [[ "$PARTITION" == "prism" ]]
    }

    ABORT()
    {
        LOGE "$*"
        return 1
    }
fi
