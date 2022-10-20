config:
	dart pub global activate fvm
	fvm install
	fvm flutter pub get
	make gen

gen:
	fvm flutter pub run build_runner build --delete-conflicting-outputs lib
	fvm flutter pub run slang

format:
	fvm flutter format .
fmt: format

run:
	fvm flutter run

test:
	(cd modules/storage && fvm flutter test)
	fvm flutter test

build-android:
	# PREPARING BUILD DIRECTORY
	mkdir build/releases
	# BUILDING APK
	fvm flutter build apk --split-per-abi
	cp build/app/outputs/apk/release/* build/releases/.
	fvm flutter build apk
	cp build/app/outputs/apk/release/* build/releases/.
	# BUILDING AAB
	fvm flutter build appbundle
	cp build/app/outputs/bundle/release/* build/releases/.
	# VALIDATE PACKAGES
	ls build/releases -1hs
	sh android/tools/check-cert.sh app-arm64-v8a-release.apk
	sh android/tools/check-cert.sh app-armeabi-v7a-release.apk
	sh android/tools/check-cert.sh app-x86_64-release.apk
	sh android/tools/check-cert.sh app-release.apk
	sh android/tools/check-cert.sh app-release.aab

.PHONY: config gen format fmt run test
