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
	# BUILDING APK
	fvm flutter build apk --split-per-abi
	ls build/app/outputs/apk/release -1hs
	# BUILDING AAB
	fvm flutter build appbundle
	ls build/app/outputs/bundle/release -1hs

.PHONY: config gen format fmt run test
