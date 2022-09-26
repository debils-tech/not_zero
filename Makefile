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

.PHONY: config gen format fmt run test
