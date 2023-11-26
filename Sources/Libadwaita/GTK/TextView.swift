//
//  TextView.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Gtk.TextView
public class TextView: NativeWidgetPeer {

    /// Initialize a text view.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_textview()
    }

    /// Get the text view's content.
    /// - Returns: The content.
    public func contents() -> String {
        let contents = gtui_textview_contents(self.nativePtr)
        if let contents {
            return String(cString: contents)
        } else {
            return ""
        }
    }

    /// Set the text view's content.
    /// - Parameter text: The new content.
    public func setContents(_ text: String) {
        gtui_editable_set_contents(self.nativePtr, text.cString)
    }
}
