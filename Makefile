config:
	dart pub global activate fvm
	fvm install
	fvm flutter pub get

generate:
	flutter pub get
	flutter pub run build_runner build --delete-conflicting-outputs lib
	flutter pub run slang
gen: generate

format:
	flutter format .
fmt: format

run:
	flutter run

test:
	flutter test

build-android:
	# PREPARING BUILD DIRECTORY
	mkdir -p build/releases
	# BUILDING APK
	flutter build apk --split-per-abi
	cp build/app/outputs/apk/release/* build/releases/.
	flutter build apk
	cp build/app/outputs/apk/release/* build/releases/.
	# BUILDING AAB
	flutter build appbundle
	cp build/app/outputs/bundle/release/* build/releases/.
	# VALIDATE PACKAGES
	ls build/releases -1hs
	sh android/tools/check-cert.sh app-arm64-v8a-release.apk
	sh android/tools/check-cert.sh app-armeabi-v7a-release.apk
	sh android/tools/check-cert.sh app-x86_64-release.apk
	sh android/tools/check-cert.sh app-release.apk
	sh android/tools/check-cert.sh app-release.aab

.PHONY: config gen format fmt run test
