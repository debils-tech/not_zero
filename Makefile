config:
	dart pub global activate fvm
	fvm install
	fvm flutter pub get

format:
	dart format .
fmt: format

fix: fmt
	dart fix --apply .


# Building and running

run:
	flutter run

test:
	flutter test

build-android:
	rm -rf build/releases/android
	flutter build apk --flavor prod --split-per-abi
	flutter build apk --flavor prod
	#flutter build appbundle --flavor prod
	TAG=foss sh tools/android/move-builds.sh
	sh tools/android/check-cert.sh

build-linux:
	rm -rf build/releases/linux
	flutter build linux
	sh tools/linux/move-builds.sh


# Code generation

dependencies:
	fvm flutter pub get
deps: dependencies

build_runner:
	fvm flutter pub run build_runner build --delete-conflicting-outputs lib

lib/i18n/translations.g.dart: $(shell find lib/i18n -name '*.i18n.yaml')
	fvm flutter pub run slang
locale: lib/i18n/translations.g.dart

web/sql-wasm.js:
	wget -O build/sqljs-wasm.zip "https://github.com/sql-js/sql.js/releases/download/v1.8.0/sqljs-wasm.zip"
	unzip -o build/sqljs-wasm.zip -d web

generate: deps build_runner locale web/sql-wasm.js
gen: generate


.PHONY: config gen format fmt run test
