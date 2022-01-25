// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "DeveloperNotes",
    products: [
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "DeveloperNotes",
            dependencies: [],
            path: ".",
            exclude: [ "README.md", "Package.swift" ]
        ),
    ]
)
