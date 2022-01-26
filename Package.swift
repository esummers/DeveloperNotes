// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "DeveloperNotes",
    products: [
        .library(name: "DeveloperNotes", targets: ["Notes"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Notes",
            dependencies: [],
            path: ".",
            exclude: [ "README.md", "Package.swift" ]
        ),
    ]
)
