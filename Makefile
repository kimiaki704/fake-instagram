setup-tools:
	@./script/tools.sh

setup-git-hooks:
	@cp -p ./script/pre-commit .git/hooks/
	@chmod u+x .git/hooks/pre-commit

swiftlint:
	@mint run realm/SwiftLint swiftlint

swiftformat-diff:
	@./script/swiftformat.sh

install-carthage:
	@mint run Carthage/Carthage carthage bootstrap --platform ios --use-ssh --cache-builds

update-carthage:
	@mint run Carthage/Carthage carthage update --platform ios --use-ssh --cache-builds

xcodegen:
	@mint run yonaskolb/XcodeGen xcodegen generate

open-xcode:
	@open FakeInstagram.xcodeproj

delete-xcode:
	@rm -rf FakeInstagram.xcodeproj
	@sleep 1.5s

close-xcode:
	@osascript script/close-xcode.scpt

reopen: close-xcode delete-xcode xcodegen install-pods open-xcode

setup: setup-tools setup-git-hooks install-carthage
