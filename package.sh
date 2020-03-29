rm -Rf "archive"

xcodebuild archive -scheme "Lima"\
    -archivePath "archive/Lima-iOS Simulator.xcarchive"\
    -destination "generic/platform=iOS Simulator"\
    SKIP_INSTALL=NO

xcodebuild archive -scheme "Lima"\
    -archivePath "archive/Lima-iOS.xcarchive"\
    -destination "generic/platform=iOS"\
    SKIP_INSTALL=NO

xcodebuild archive -scheme "Lima"\
    -archivePath "archive/Lima-macOS.xcarchive"\
    -destination "platform=macOS,arch=x86_64"\
    SKIP_INSTALL=NO

rm -Rf "Lima.xcframework"

xcodebuild -create-xcframework\
    -framework "archive/Lima-iOS Simulator.xcarchive/Products/Library/Frameworks/Lima.framework"\
    -framework "archive/Lima-iOS.xcarchive/Products/Library/Frameworks/Lima.framework"\
    -framework "archive/Lima-macOS.xcarchive/Products/Library/Frameworks/Lima.framework"\
    -output "Lima.xcframework"

