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
                    url: "https://github.com/r0ml/FFI-Framework/releases/download/0.2.0/libffi.xcframework.zip",
                    checksum: "d55719198d2104b9439537b391381e98e6383f75af2caf4b0a3efd2076066724"
                   )
    ]
)

