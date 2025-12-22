#!/bin/bash

# Run this file like this:
# bash tools/android/check-version-code.sh [RELEASE_DIR] [EXPECTED_VERSION_CODE]
#
# If RELEASE_DIR is not provided, it defaults to apps/not_zero_app/build/releases/android
# If EXPECTED_VERSION_CODE is not provided, it is extracted from apps/not_zero_app/pubspec.yaml

# Exit immediately if a command exits with a non-zero status.
set -e

RELEASE_DIR=${1:-apps/not_zero_app/build/releases/android}
EXPECTED_CODE="$2"

BUILD_TOOLS_PATH=$(tools/android/platform-tools-path.sh)
AAPT_PATH="$BUILD_TOOLS_PATH/aapt"

if [ ! -x "$AAPT_PATH" ]; then
    echo "Error: aapt tool not found at $AAPT_PATH"
    exit 1
fi

if [ -z "$EXPECTED_CODE" ]; then
    PUBSPEC_PATH="apps/not_zero_app/pubspec.yaml"
    if [ -f "$PUBSPEC_PATH" ]; then
        # Extract version line: "version: 0.13.0+22" -> "22"
        VERSION_LINE=$(grep '^version: ' "$PUBSPEC_PATH")
        EXPECTED_CODE=$(echo "$VERSION_LINE" | sed 's/.*+//')
        if [ -z "$EXPECTED_CODE" ]; then
             echo "Error: Could not parse version code from $PUBSPEC_PATH"
             exit 1
        fi
    else
        echo "Error: pubspec.yaml not found and no version code provided."
        exit 1
    fi
fi

echo "Checking APKs in $RELEASE_DIR for versionCode=$EXPECTED_CODE..."
echo "Using aapt: $AAPT_PATH"

FOUND_ERROR=0

shopt -s nullglob
apk_files=("$RELEASE_DIR"/*.apk)

if [ ${#apk_files[@]} -eq 0 ]; then
    echo "No APK files found in $RELEASE_DIR"
    exit 1
fi

for APK in "${apk_files[@]}"; do
    FILE_NAME=$(basename "$APK")

    BADGING=$("$AAPT_PATH" dump badging "$APK" 2>/dev/null)
    ACTUAL_CODE=$(echo "$BADGING" | grep "package:" | sed -n "s/.*versionCode='\([0-9]*\)'.*/\1/p")

    if [ "$ACTUAL_CODE" == "$EXPECTED_CODE" ]; then
        echo -e "\033[92m ✔️  $FILE_NAME has correct versionCode ($ACTUAL_CODE)\033[0m"
    else
        echo -e "\033[91m ❌  $FILE_NAME has WRONG versionCode ($ACTUAL_CODE). Expected: $EXPECTED_CODE\033[0m"
        FOUND_ERROR=1
    fi
done

if [ $FOUND_ERROR -eq 1 ]; then
    echo "Verification failed."
    exit 1
else
    echo "All APKs verified successfully."
fi
