//
//  ToggleButton.swift
//  Libadwaita
//
//  Created by david-swift on 19.12.23.
//

import CGTUI

/// Gtk.ToggleButton
public class ToggleButton: Button {

    /// Initialize a toggle button.
    /// - Parameter label: The toggle button's label.
    override public init(_ label: String) {
        super.init()
        self.nativePtr = gtui_create_togglebutton(label.cString)
        super.initSignals()
    }

    /// Set whether the toggle button is active.
    /// - Parameter active: Whether the toggle button is active.
    public func setActive(_ active: Bool) {
        gtui_togglebutton_set_active(self.nativePtr, active.cBool)
    }

    /// Set the toggle button's label if it contains an icon.
    /// - Parameters:
    ///     - icon: The button's icon.
    ///     - label: The button's text label.
    public func setLabel(icon: Icon, label: String?) {
        let content = ButtonContent(icon: icon, label: label)
        gtui_button_set_child(self.nativePtr, content.nativePtr)
    }

}
