APK_DIR="build/app/outputs/flutter-apk"
AAB_DIR="build/app/outputs/bundle/release"
RELEASE_DIR="build/releases/android"
APP_NAME="not_zero-android"

: "${TAG:=release}"
VERSION=$(sh tools/get-version.sh)
BUILD_TAG="$VERSION-$TAG"

alias copy_artifact="sh tools/copy_artifact.sh"

mkdir -p $RELEASE_DIR
rm -f $RELEASE_DIR/*

copy_artifact $APK_DIR/app-arm64-v8a-prod-release.apk $RELEASE_DIR/$APP_NAME-arm64-v8a-"$BUILD_TAG".apk &
copy_artifact $APK_DIR/app-armeabi-v7a-prod-release.apk $RELEASE_DIR/$APP_NAME-armeabi-v7a-"$BUILD_TAG".apk &
copy_artifact $APK_DIR/app-x86_64-prod-release.apk $RELEASE_DIR/$APP_NAME-x86_64-"$BUILD_TAG".apk &
copy_artifact $APK_DIR/app-prod-release.apk $RELEASE_DIR/$APP_NAME-multiabi-"$BUILD_TAG".apk &
copy_artifact $AAB_DIR/app-prod-release.aab $RELEASE_DIR/$APP_NAME-"$BUILD_TAG".aab

wait

printf "\033[92m ✔️ Android builds copied into \"$RELEASE_DIR\":\033[0m\n"
ls $RELEASE_DIR -1hs
