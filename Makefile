config:
	dart pub global activate fvm
	fvm install
	fvm flutter pub get

format:
	flutter format .
fmt: format


# Building and running

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


# Code generation

dependencies:
	flutter pub get
deps: dependencies

build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs lib

lib/i18n/translations.g.dart: $(shell find lib/i18n -name '*.i18n.yaml')
	flutter pub run slang
locale: lib/i18n/translations.g.dart

web/sql-wasm.js:
	wget -O build/sqljs-wasm.zip "https://github.com/sql-js/sql.js/releases/download/v1.8.0/sqljs-wasm.zip"
	unzip -o build/sqljs-wasm.zip -d web

generate: deps build_runner locale web/sql-wasm.js
gen: generate


.PHONY: config gen format fmt run test
