#!/bin/bash

RELEASE_DIR="release_notes/$1"
RELEASE_FILENAME="RELEASE_NOTES.md"

echo "Searching for release notes in $RELEASE_DIR. Filename is $RELEASE_FILENAME"

if [ -f "$RELEASE_DIR/github/$RELEASE_FILENAME" ]; then
  echo "Nice! Release file for GitHub found"
else
  echo "Release notes file for GitHub not found"
  exit 1
fi
