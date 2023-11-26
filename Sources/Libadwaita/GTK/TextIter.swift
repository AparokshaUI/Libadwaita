//
//  TextIter.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Gtk.TextIter
public class TextIter: NativePeer {

    /// Initialize a text iter with an identifier.
    /// - Parameter addr: The identifier.
    internal init(addr: UInt64) {
        super.init()
        self.nativePtr = addr
    }
}
