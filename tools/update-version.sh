#!/bin/bash

TAG_VERSION="$(echo "$1" | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+")"

CURRENT_VERSION=$(grep '^version: ' apps/not_zero_app/pubspec.yaml | sed 's/version: //')
CURRENT_BUILD_NUMBER=$(echo "$CURRENT_VERSION" | cut -d'+' -f2)

if [ -z "$CURRENT_BUILD_NUMBER" ]; then
  CURRENT_BUILD_NUMBER=0
fi
NEW_BUILD_NUMBER=$((CURRENT_BUILD_NUMBER + 1))

sed -i "s/version: $CURRENT_VERSION/version: $TAG_VERSION+$NEW_BUILD_NUMBER/" apps/not_zero_app/pubspec.yaml

echo -e "app_version=$TAG_VERSION\n""app_build_number=$NEW_BUILD_NUMBER"
