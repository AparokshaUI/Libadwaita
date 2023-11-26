//
//  ButtonContent.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.ButtonContent
public class ButtonContent: NativeWidgetPeer {

    /// Initialize the button content.
    /// - Parameters:
    ///   - icon: The button content's icon.
    ///   - label: The button content's (optional) label.
    public init(icon: Icon, label: String? = nil) {
        super.init()
        self.nativePtr = gtui_create_buttoncontent()
        if let label { setLabel(label) }
        setIcon(icon)
    }

    /// Set the button content's label.
    /// - Parameter label: The new label.
    public func setLabel(_ label: String) {
        gtui_buttoncontent_set_label(self.nativePtr, label.cString)
    }

    /// Set the button content's icon.
    /// - Parameter icon: The new icon.
    public func setIcon(_ icon: Icon) {
        gtui_buttoncontent_set_icon(self.nativePtr, icon.string.cString)
    }
}
