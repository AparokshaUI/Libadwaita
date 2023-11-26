//
//  MenuButton.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Gtk.MenuButton
public class MenuButton: NativeWidgetPeer {

    /// The button's label, if it is not a simple text button.
    var content: ButtonContent?
    /// The button's menu.
    var menu: Menu = .init()

    /// Initialize a menu button.
    /// - Parameter label: The button's label.
    public init(_ label: String) {
        super.init()
        self.nativePtr = gtui_create_menubutton()
        setLabel(label)
        gtui_menubutton_set_menu(self.nativePtr, menu.nativePtr)
    }

    // swiftlint:disable function_default_parameter_at_end
    /// Initialize a menu button.
    /// - Parameters:
    ///   - label: The button's label.
    ///   - icon: The button's icon.
    public convenience init(_ label: String? = nil, icon: Icon) {
        self.init(label ?? "")
        content = ButtonContent(icon: icon, label: label)
        if let content { gtui_menubutton_set_child(self.nativePtr, content.nativePtr) }
    }
    // swiftlint:enable function_default_parameter_at_end

    /// Set the menu button's label if it is a simple text button.
    /// - Parameter text: The new label.
    public func setLabel(_ text: String) { gtui_menubutton_set_label(self.nativePtr, text.cString) }

    /// Get the button's content.
    /// - Returns: The button's content.
    public func getContent() -> ButtonContent? { content }

    /// Get the button's menu.
    /// - Returns: The button's menu.
    public func getMenu() -> Menu { menu }

    /// Modify the button's menu.
    /// - Parameter edit: Modify the menu.
    /// - Returns: The menu button.
    public func menu(edit: (Menu) -> Void) -> Self {
        edit(menu)
        return self
    }

    /// Set a new menu for the menu button.
    /// - Parameter menu: The new menu.
    /// - Returns: The menu button.
    public func menu(_ menu: Menu) -> Self {
        gtui_menubutton_set_menu(self.nativePtr, menu.nativePtr)
        self.menu = menu
        return self
    }
}
