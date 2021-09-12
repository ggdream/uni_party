.PHONY: android icon splash protoenv proto


android:
	@flutter build apk --target-platform android-arm64 --split-per-abi

icon:
	@flutter pub run flutter_launcher_icons:main

splash:
	@flutter pub run flutter_native_splash:create

protoenv:
	@dart pub global activate protoc_plugin

proto:
	@protoc  --dart_out=. ./lib/tools/chat/generated/protocol.proto
