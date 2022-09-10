config:
	dart pub global activate fvm
	fvm install
	fvm flutter pub get
	make gen

gen:
	fvm flutter pub run build_runner build --delete-conflicting-outputs lib

format, fmt:
	fvm flutter format .

run:
	fvm flutter run
