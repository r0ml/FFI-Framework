
# First, build all the targets
# 1) brew install autoconf automake libtool
# 2) ./autogen.sh
# 3) ./configure
# 4) python3 generate-darwin-source-and-headers.py
# comment out line 21 of darwin_common/include/fficonfig.h
# comment out line 21 of darwin_common/include/ffitarget.h
# comment out line 21 of darwin_common/include/ffi.h
# xcodebuild -target libffi-iOS -configuration Release
# xcodebuild -target libffi-tvOS -configuration Release
# xcodebuild -target libffi-static-Mac -configuration Release

# results are in the build folder

# rm -rf libffi.xcframework
# xcodebuild -create-xcframework -library Release-appletvos/libffi.a -headers Release-appletvos/include -library Release-iphoneos/libffi.a -headers Release-iphoneos/include -library Release/libffi.a -headers Release/include -output libffi.xcframework

# rm libffi.xcframework.zip
# zip -r libffi.xcframework.zip libffi.xcframework
# swift package compute-checksum libffi.xcframework.zip | xargs -I '{}' sed -I '' 's/\(checksum: "\).*\("\)/\1{}\2/' Package.swift


