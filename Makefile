# Unazin - atalhos para Flutter
.PHONY: run get doctor

run: get
	flutter run

get:
	flutter pub get

doctor:
	flutter doctor -v
