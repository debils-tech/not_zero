#!/bin/bash

LINUX_DIR="build/linux/x64/release"
RELEASE_DIR="build/releases/linux"
APP_NAME="not_zero-linux"

: "${TAG:=release}"
VERSION=$(tools/get-version.sh)
BUILD_TAG="$VERSION-$TAG"

mkdir -p $RELEASE_DIR
rm -f $RELEASE_DIR/*

(cd $LINUX_DIR && tar -cz bundle -f bundle.tar.gz)
tools/copy-artifact.sh $LINUX_DIR/bundle.tar.gz $RELEASE_DIR/$APP_NAME-x86_64-"$BUILD_TAG".tar.gz

echo -e "\033[92m ✔️ Linux builds copied into \"$RELEASE_DIR\":\033[0m"
ls $RELEASE_DIR -1hs
