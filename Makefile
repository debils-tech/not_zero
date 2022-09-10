config:
	dart pub global activate fvm
	fvm install
	fvm flutter pub get
	make gen

gen:
	fvm flutter pub run build_runner build --delete-conflicting-outputs lib

format:
	fvm flutter format .
fmt: format

run:
	fvm flutter run
