.PHONY: android
android:
	@flutter build apk

.PHONY: icon
icon:
	@flutter pub run flutter_launcher_icons:main

.PHONY: splash
splash:
	@flutter pub run flutter_native_splash:create
