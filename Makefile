get:
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs

update:
	flutter pub upgrade --major-versions

get_all:
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs

gen_icons:
	dart run flutter_launcher_icons:main -f flutter_launcher_icons*

clean:
	flutter clean

coverage:
	flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html
	open coverage/html/index.html

watch:
	dart run build_runner watch

gen:
	dart run build_runner build --delete-conflicting-outputs