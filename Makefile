build_runner:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

build_ios:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter build ipa --dart-define FLAVOR=production --flavor production
	open -a Xcode ./build/ios/archive/Runner.xcarchive

build_android:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter build appbundle --dart-define FLAVOR=production --flavor production
	open ./build/app/outputs/bundle/productionRelease
	cd ./build/app/intermediates/flutter/productionRelease;\
	mkdir -p obj;\
	cp -r ./arm64-v8a ./armeabi-v7a ./x86_64 ./obj;\
	cd ./obj;\
	zip -r symbols.zip .;\
	open .
