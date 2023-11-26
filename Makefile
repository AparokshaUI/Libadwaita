docs:
	@sourcedocs generate --min-acl private -r --spm-module Libadwaita

swiftlint:
	@swiftlint --autocorrect

format:
	@clang-format -i Sources/CGTUI/shim.h  --style=file
