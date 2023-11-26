//
//  Label.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI
import Foundation

/// Gtk.Label
public class Label: NativeWidgetPeer {

    /// Initialize a label.
    /// - Parameter text: The label's content.
    public init(_ text: String) {
        super.init()
        self.nativePtr = gtui_create_label(text.cString)
    }

    /// Set the label's content.
    /// - Parameter text: The content.
    public func setText(_ text: String) { gtui_label_set_text(self.nativePtr, text.cString) }
}
