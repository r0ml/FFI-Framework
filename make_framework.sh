
# First, build all the targets
# 1) brew install autoconf automake libtool
# 2) ./autogen.sh
# 3) ./configure
# 4) python3 generate-darwin-source-and-headers.py
# comment out line 21 of darwin_common/include/fficonfig.h
# comment out line 21 of darwin_common/include/ffitarget.h
# comment out line 21 of darwin_common/include/ffi.h


xcodebuild -scheme libffi-iOS -configuration Release -destination "generic/platform=iOS Simulator" BUILD_DIR=build
xcodebuild -scheme libffi-iOS -configuration Release -destination "generic/platform=iOS" BUILD_DIR=build
xcodebuild -scheme libffi-tvOS -configuration Release -destination "generic/platform=tvOS Simulator" BUILD_DIR=build
xcodebuild -scheme libffi-tvOS -configuration Release -destination "generic/platform=tvOS" BUILD_DIR=build
xcodebuild -scheme libffi-iOS -configuration Release -destination "platform=macOS,variant=Mac Catalyst" BUILD_DIR=build
# xcodebuild -scheme libffi-iOS -configuration Release -destination "platform=macOS,variant=Designed for iPad" BUILD_DIR=build
# xcodebuild -target libffi-static-Mac -configuration Release


# results are in the build folder
# in ffi.h, replace regular expression  <(ffi.*)>   with    "$1"
# in all the Release*/include/ffi/ffi.h

cd build

ls **/*.h | xargs sed -I '' 's/<\(ffi.*\)>/"\1"/'

rm -rf libffi.xcframework
xcodebuild -create-xcframework -library Release-appletvos/libffi.a -headers Release-appletvos/include -library Release-iphoneos/libffi.a -headers Release-iphoneos/include -library Release-iphonesimulator/libffi.a -headers Release-iphonesimulator/include -library Release-maccatalyst/libffi.a -headers Release-maccatalyst/include -output libffi.xcframework

rm libffi.xcframework.zip
zip -r libffi.xcframework.zip libffi.xcframework

# swift package compute-checksum libffi.xcframework.zip | xargs -I '{}' sed -I '' 's/\(checksum: "\).*\("\)/\1{}\2/' Package.swift


