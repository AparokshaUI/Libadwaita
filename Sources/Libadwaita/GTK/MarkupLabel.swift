//
//  MarkupLabel.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI
import Foundation

/// Gtk.Label
public class MarkupLabel: NativeWidgetPeer {

    /// Initialize a markup label.
    /// - Parameter text: The content.
    public init(_ text: String) {
        super.init()
        self.nativePtr = gtui_create_markup_label(text.cString)
    }

    /// Set the text of a markup label.
    /// - Parameter text: The text.
    public func setText(_ text: String) { gtui_label_set_text(self.nativePtr, text.cString) }
}
