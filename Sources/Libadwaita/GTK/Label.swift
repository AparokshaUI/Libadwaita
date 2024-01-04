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

    /// Initialize a label.
    override init() {
        super.init()
    }

    /// Set the label's content.
    /// - Parameter text: The content.
    public func setText(_ text: String) { gtui_label_set_text(self.nativePtr, text.cString) }

    /// Set whether the label should span multiple lines if the space gets narrow.
    /// - Parameter wrap: Whether to wrap or not.
    /// - Returns: The label.
    public func wrap(_ wrap: Bool = true) -> Label {
        gtui_label_set_wrap(self.nativePtr, wrap.cBool)
        return self
    }
}
