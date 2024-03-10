// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FFI-Framework",
    platforms: [.iOS(.v13), .tvOS(.v13), .macCatalyst(.v13)],
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
                    url: "https://github.com/r0ml/FFI-Framework/releases/download/0.4.0/libffi.xcframework.zip",
                    checksum: "430b2eaae00f3290f5f5aefd1a56037298d6be2f9f16d9135cebe03a8f0b82ef"
                   )
    ]
)

