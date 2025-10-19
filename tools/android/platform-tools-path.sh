#!/bin/bash

# This script finds the path to the Android SDK build-tools directory.
# It performs a series of checks to locate the Android SDK, selects a suitable
# build-tools version, and installs one if necessary.

# Exit immediately if a command exits with a non-zero status.
set -e

# --- 1. Find Android SDK directory ---
# The script will search for the Android SDK in common locations and environment variables.
# It exports ANDROID_HOME if found, to be used by subsequent commands.

if [ -z "$ANDROID_HOME" ]; then
  if [ -n "$ANDROID_SDK_ROOT" ]; then
    ANDROID_HOME="$ANDROID_SDK_ROOT"
    echo "Using ANDROID_SDK_ROOT as ANDROID_HOME: $ANDROID_HOME" >&2
  else
    case "$(uname -s)" in
      Darwin)
        # Default macOS SDK location
        [ -d "$HOME/Library/Android/sdk" ] && ANDROID_HOME="$HOME/Library/Android/sdk"
        ;;
      Linux)
        # Default Linux SDK locations
        if [ -d "$HOME/Android/sdk" ]; then
          ANDROID_HOME="$HOME/Android/sdk"
        elif [ -d "/usr/local/lib/android/sdk" ]; then # For CI environments like GitHub Actions
          ANDROID_HOME="/usr/local/lib/android/sdk"
        fi
        ;;
    esac
  fi
fi

if [ -n "$ANDROID_HOME" ] && [ -d "$ANDROID_HOME" ]; then
  echo "Android SDK found at: $ANDROID_HOME" >&2
  export ANDROID_HOME
else
  echo "Error: Android SDK not found." >&2
  echo "Please set ANDROID_HOME or ANDROID_SDK_ROOT, or install the SDK in a standard location." >&2
  exit 1
fi

# --- 2. Select build-tools version ---
# It checks for specific versions, then falls back to detecting the latest version.
# If no build tools are found, it attempts to install version 36.1.0.

BUILD_TOOLS_DIR="$ANDROID_HOME/build-tools"
BUILD_TOOLS_VERSION=""

# Ensure build-tools directory exists
mkdir -p "$BUILD_TOOLS_DIR"

# 2.1 & 2.2: Check for preferred versions
if [ -d "$BUILD_TOOLS_DIR/36.1.0" ]; then
  BUILD_TOOLS_VERSION="36.1.0"
elif [ -d "$BUILD_TOOLS_DIR/36.0.0" ]; then
  BUILD_TOOLS_VERSION="36.0.0"
else
  # Find available versions. Use find to list only directories.
  VERSIONS=($(find "$BUILD_TOOLS_DIR" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;))
  VERSION_COUNT=${#VERSIONS[@]}

  if [ "$VERSION_COUNT" -eq 1 ]; then
    # 2.3: If only one version, use it
    BUILD_TOOLS_VERSION="${VERSIONS[0]}"
  elif [ "$VERSION_COUNT" -gt 1 ]; then
    # 2.4: If multiple, find the highest version
    BUILD_TOOLS_VERSION=$(printf "%s\n" "${VERSIONS[@]}" | sort -V | tail -n 1)
  else
    # 2.5: If no versions, install one
    echo "No build-tools found. Attempting to install 'build-tools;36.1.0'..." >&2
    SDK_MANAGER="$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager"

    if [ ! -f "$SDK_MANAGER" ]; then
      echo "Error: sdkmanager not found at '$SDK_MANAGER'. Cannot automatically install build-tools." >&2
      exit 1
    fi

    # Accept licenses before trying to install
    (yes | "$SDK_MANAGER" --licenses) > /dev/null || echo "Warning: Failed to accept licenses, installation may fail." >&2
    
    "$SDK_MANAGER" "build-tools;36.1.0"
    
    if [ -d "$BUILD_TOOLS_DIR/36.1.0" ]; then
        BUILD_TOOLS_VERSION="36.1.0"
    else
        echo "Error: Installation of build-tools;36.1.0 failed." >&2
        exit 1
    fi
  fi
fi

if [ -z "$BUILD_TOOLS_VERSION" ]; then
  echo "Error: Could not determine a suitable build-tools version." >&2
  exit 1
fi

# --- 3. Echo the resulting path ---
echo "$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION"
