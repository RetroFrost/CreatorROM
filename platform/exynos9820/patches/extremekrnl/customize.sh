# Copyright (c) 2026 RetroFrost
# SPDX-License-Identifier: GPL-3.0-or-later

EXTREMEKRNL_REPO="https://github.com/Android-Artisan/android_kernel_samsung_exynos9820"
EXTREMEKRNL_BRANCH="main"
KERNEL_TMP_DIR="$OUT_DIR/kernel_tmp-$TARGET_PLATFORM"

SYNC_KERNEL_SOURCE()
{
    if [ ! -d "$KERNEL_TMP_DIR/.git" ]; then
        [ -e "$KERNEL_TMP_DIR" ] && ABORT "Kernel path exists but is not a Git repository: $KERNEL_TMP_DIR"
        LOG "- Cloning the Exynos 9820 kernel source"
        EVAL "git clone --branch \"$EXTREMEKRNL_BRANCH\" --single-branch --recurse-submodules \"$EXTREMEKRNL_REPO\" \"$KERNEL_TMP_DIR\"" || exit 1
        return 0
    fi

    LOG "- Updating the Exynos 9820 kernel source"
    EVAL "git -C \"$KERNEL_TMP_DIR\" fetch origin \"$EXTREMEKRNL_BRANCH\"" || exit 1

    local LOCAL REMOTE BASE
    LOCAL="$(git -C "$KERNEL_TMP_DIR" rev-parse HEAD)"
    REMOTE="$(git -C "$KERNEL_TMP_DIR" rev-parse "origin/$EXTREMEKRNL_BRANCH")"
    BASE="$(git -C "$KERNEL_TMP_DIR" merge-base HEAD "origin/$EXTREMEKRNL_BRANCH")"

    if [[ "$LOCAL" == "$REMOTE" ]]; then
        return 0
    elif [[ "$LOCAL" == "$BASE" ]]; then
        EVAL "git -C \"$KERNEL_TMP_DIR\" merge --ff-only \"origin/$EXTREMEKRNL_BRANCH\"" || exit 1
    else
        ABORT "Kernel checkout has local or divergent changes: $KERNEL_TMP_DIR"
    fi
}

BUILD_KERNEL()
{
    LOG "- Building kernel for $TARGET_CODENAME"
    EVAL "cd \"$KERNEL_TMP_DIR\" && ./build.sh -m \"$TARGET_CODENAME\" -k y -r n" || exit 1
}

INSTALL_KERNEL_BINARIES()
{
    local KERNEL_OUT="$KERNEL_TMP_DIR/build/out/$TARGET_CODENAME"
    mkdir -p "$WORK_DIR/kernel"

    for IMAGE in boot dtb dtbo; do
        if [ ! -f "$KERNEL_OUT/$IMAGE.img" ]; then
            ABORT "Kernel build did not produce $KERNEL_OUT/$IMAGE.img"
        fi
        mv -f "$KERNEL_OUT/$IMAGE.img" "$WORK_DIR/kernel/$IMAGE.img"
    done
}

SYNC_KERNEL_SOURCE
BUILD_KERNEL
INSTALL_KERNEL_BINARIES
