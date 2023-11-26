//
//  String.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import Foundation

extension String {

    /// A representation of the string in C.
    var cString: UnsafePointer<CChar>? { .init(NSString(string: self).utf8String) }

    /// Add the Ctrl key to a shortcut.
    /// - Returns: The shortcut.
    public func ctrl() -> String { "<Ctrl>\(self)" }

    /// Add the Shift key to a shortcut.
    /// - Returns: The shortcut.
    public func shift() -> String { "<Shift>\(self)" }

    /// Add the Alt key to a shortcut.
    /// - Returns: The shortcut.
    public func alt() -> String { "<Alt>\(self)" }

    /// Add the Meta key to a shortcut.
    /// - Returns: The shortcut.
    public func meta() -> String { "<Meta>\(self)" }

    /// Add the Super key to a shortcut.
    /// - Returns: The shortcut.
    public func `super`() -> String { "<Super>\(self)" }

    /// Add the Hyper key to a shortcut.
    /// - Returns: The shortcut.
    public func hyper() -> String { "<Hyper>\(self)" }
}
