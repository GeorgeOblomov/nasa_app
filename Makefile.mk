clean:
	flutter clean
	flutter pub get

run_tests:
	flutter test

update_goldens:
	flutter test --update-godlens

build_entities:
	flutter pub run build_runner build --delete-conflicting-outputs