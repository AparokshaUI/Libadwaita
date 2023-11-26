// swift-tools-version: 5.7
//
//  Package.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import PackageDescription

/// The Libadwaita package.
let package = Package(
    name: "Libadwaita",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "Libadwaita",
            targets: ["Libadwaita"]
        )
    ],
    targets: [
        .systemLibrary(
            name: "CGTUI",
            pkgConfig: "libadwaita-1"
        ),
        .target(
            name: "Libadwaita",
            dependencies: ["CGTUI"]
        ),
        .executableTarget(
            name: "SwiftGui",
            dependencies: ["Libadwaita"],
            path: "Tests"
        )
    ]
)
