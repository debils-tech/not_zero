# Building and running

build-android:
	cd apps/not_zero_app && flutter build apk --flavor foss --split-per-abi
	cd apps/not_zero_app && flutter build apk --flavor foss
#    cd apps/not_zero_app && flutter build appbundle
	FLAVOR=foss sh tools/android/move-builds.sh
	sh tools/android/check-cert.sh

build-linux:
	rm -rf apps/not_zero_app/build/releases/linux
	cd apps/not_zero_app && flutter build linux
	sh tools/linux/move-builds.sh
