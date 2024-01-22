> [!NOTE]
> This project is no longer maintained.
> An alternative is the declarative framework [Adwaita for Swift](https://github.com/AparokshaUI/adwaita-swift).

<p align="center">
  <img width="256" alt="Libadwaita Icon" src="Icons/LibadwaitaIcon.png">
  <h1 align="center">Libadwaita</h1>
</p>

<p align="center">
  <a href="https://github.com/david-swift/Libadwaita">
  GitHub
  </a>
  ·
  <a href="Documentation/Reference/README.md">
  Contributor Docs
  </a>
</p>

_Libadwaita_ is an imperative UI framework for GNOME.

## Table of Contents

- [Installation](#Installation)
- [Usage](#Usage)
- [Thanks](#Thanks)

## Installation

### Dependencies
If you are using a Linux distribution, install `libadwaita-devel` or `libadwaita` (or something similar, based on the package manager) as well as `gtk4-devel`, `gtk4` or similar.

On macOS, follow these steps:
1. Install [Homebrew](https://brew.sh).
2. Install Libadwaita (and thereby GTK 4):
```
brew install libadwaita
```

### Swift Package
1. Open your Swift package in GNOME Builder, Xcode, or any other IDE.
2. Open the `Package.swift` file.
3. Into the `Package` initializer, under `dependencies`, paste:
```swift
.package(url: "https://github.com/david-swift/Libadwaita", from: "0.1.0")   
```

## Usage

You can find an example project [here](Tests/main.swift).
I encourage you to use _Libadwaita_ indirectly with the declarative [_Adwaita_ wrapper](https://github.com/david-swift/Adwaita).

## Thanks

- The [contributors](Contributors.md), especially [**JCWasmx86**](https://github.com/JCWasmx86) for having started the project
- [SwiftLint](https://github.com/realm/SwiftLint) for checking whether code style conventions are violated
- The programming language [Swift](https://github.com/apple/swift)
- [SourceDocs](https://github.com/SourceDocs/SourceDocs) used for generating the [docs](Documentation/Reference/README.md)
- [Libadwaita](https://gitlab.gnome.org/GNOME/libadwaita) for the widgets
