config:
	flutter pub get
	make gen

gen:
	flutter pub run build_runner build --delete-conflicting-outputs lib
