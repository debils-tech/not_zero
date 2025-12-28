#!/bin/bash

TARGET_MAJOR_MINOR=$(echo "$1" | grep -Eo "[0-9]+\.[0-9]+")
PUBSPEC_PATH="apps/not_zero_app/pubspec.yaml"
CURRENT_FULL_VERSION=$(grep '^version: ' $PUBSPEC_PATH | sed 's/version: //')

# Remove build number to get semver (e.g., "0.14.0")
CURRENT_SEMVER=$(echo "$CURRENT_FULL_VERSION" | cut -d'+' -f1)
# Extract Major.Minor (e.g., "0.14")
CURRENT_MAJOR_MINOR=$(echo "$CURRENT_SEMVER" | cut -d'.' -f1,2)
# Extract Patch (e.g., "0")
CURRENT_PATCH=$(echo "$CURRENT_SEMVER" | cut -d'.' -f3)
# Extract Build Number (e.g., "10")
CURRENT_BUILD_NUMBER=$(echo "$CURRENT_FULL_VERSION" | cut -d'+' -f2)

if [ -z "$CURRENT_BUILD_NUMBER" ] || [ "$CURRENT_BUILD_NUMBER" == "$CURRENT_SEMVER" ]; then
  CURRENT_BUILD_NUMBER=0
fi

if [ "$CURRENT_MAJOR_MINOR" == "$TARGET_MAJOR_MINOR" ]; then
  # Versions match (e.g. 0.14 == 0.14)
  # Increment Patch
  NEW_PATCH=$((CURRENT_PATCH + 1))
else
  # Versions do not match (e.g. 0.13 != 0.14)
  # Set Patch to 0
  NEW_PATCH=0
fi

NEW_BUILD_NUMBER=$((CURRENT_BUILD_NUMBER + 1))

NEW_TAG_VERSION="$TARGET_MAJOR_MINOR.$NEW_PATCH"
NEW_FULL_VERSION="$NEW_TAG_VERSION+$NEW_BUILD_NUMBER"

sed -i "s/^version: .*/version: $NEW_FULL_VERSION/" $PUBSPEC_PATH

echo "app_version=$NEW_TAG_VERSION"
echo "app_build_number=$NEW_BUILD_NUMBER"
