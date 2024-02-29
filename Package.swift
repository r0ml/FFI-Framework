// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FFI-Framework",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FFI-Framework",
            targets: ["ffi"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
    //  .binaryTarget(name: "ffi", path: "libffi.xcframework"),
      .binaryTarget(name: "ffi",
                    url: "https://github.com/r0ml/FFI-Framework/releases/download/0.3.0/libffi.xcframework.zip",
                    checksum: "4f83f29cdfeadaa43cd30a46b32023765aab771e6d4989f61dad0cb3946a6b20"
                   )
    ]
)

