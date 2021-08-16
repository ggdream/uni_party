.PHONY: android
android:
	@flutter build apk --target-platform android-arm64 --split-per-abi

.PHONY: icon
icon:
	@flutter pub run flutter_launcher_icons:main

.PHONY: splash
splash:
	@flutter pub run flutter_native_splash:create
