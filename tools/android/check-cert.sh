#!/bin/bash

# Run this file like this:
# bash tools/android/check-cert.sh app-arm64-v8a-release.apk

RELEASE_DIR=apps/not_zero_app/build/releases/android
FINGERPRINT="SHA-256 digest: 3847cfe3a52dfddebcfa51af3ed322a4196ea76b3d659e1001b922ed0a17fd8a"
APKSIGNER_PATH="$(tools/android/platform-tools-path.sh)/apksigner"

check_cert () {
    FILE_CERT=$($APKSIGNER_PATH verify --print-certs "$1")

    if echo "$FILE_CERT" | grep -q "$FINGERPRINT"; then
        echo -e "\033[92m ✔️  \"$(basename $1)\" certificate fingerprint valid\033[0m"
    else
        echo -e "\033[93m ⚠️  \"$(basename $1)\" hasn't got trusted certificate fingerprint\033[0m"
        exit 1
    fi
}

for FILE in "$RELEASE_DIR"/*; do
    check_cert "$FILE"
done
