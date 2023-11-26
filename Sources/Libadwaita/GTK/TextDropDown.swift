//
//  TextDropdown.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI
import Foundation

/// Gtk.DropDown
public class TextDropDown: NativeWidgetPeer {

    /// The strling list's identifier.
    private let stringListPtr: UInt64

    /// Initialize a drop down.
    override public init() {
        self.stringListPtr = gtui_create_stringlist()
        super.init()
        self.nativePtr = gtui_create_text_dropdown(self.stringListPtr)
    }

    /// Add an entry to the drop down.
    /// - Parameter string: The entry.
    /// - Returns: The drop down.
    public func append(_ string: String) -> TextDropDown {
        gtui_stringlist_append(self.stringListPtr, string.cString)
        return self
    }

    /// Get the selected entry.
    /// - Returns: The selected entry.
    public func selected() -> String {
        let str = gtui_stringlist_get_selected(self.nativePtr, self.stringListPtr)
        if let str {
            return String(cString: str)
        } else {
            return ""
        }
    }
}
