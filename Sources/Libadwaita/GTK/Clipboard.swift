//
//  Clipboard.swift
//  Libadwaita
//
//  Created by david-swift on 20.12.23.
//

import CGTUI

/// Gtk.Clipboard
public enum Clipboard {

    /// Copy a string.
    /// - Parameter text: The string.
    public static func copy(_ text: String) {
        gtui_clipboard_copy(text.cString)
    }

}
