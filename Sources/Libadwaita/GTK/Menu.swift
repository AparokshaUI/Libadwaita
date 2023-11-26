//
//  Menu.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Gtk.Menu
public class Menu: NativePeer {

    /// The labels of the components of the menu.
    private var labels: [String] = []

    /// Initialize a menu.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_menu()
    }

    /// Initialize an action.
    /// - Parameters:
    ///   - label: The action's label.
    ///   - app: The application.
    ///   - win: The application window.
    ///   - id: The action's identifier.
    ///   - shortcut: The action's keyboard shortcut.
    ///   - handler: The action's handler.
    /// - Returns: The action's identifier.
    func initAction(
        _ label: String,
        app: Application? = nil,
        win: ApplicationWindow? = nil,
        id: String? = nil,
        shortcut: String = "",
        handler: (() -> Void)? = nil
    ) -> String {
        let label = label.filter { $0.isLetter || $0.isNumber || $0 == "-" || $0 == "." }
        if let handler, let app {
            app.addKeyboardShortcut(shortcut, id: id ?? label, handler: handler)
            return "app.\(label)"
        }
        if let handler, let win {
            win.addKeyboardShortcut(shortcut, id: id ?? label, handler: handler)
            return "win.\(label)"
        }
        return id ?? ""
    }

    /// Add a button to the end.
    /// - Parameters:
    ///   - label: The button's label.
    ///   - id: The action's id.
    /// - Returns: The menu.
    public func append(_ label: String, id: String) -> Menu {
        let fullID = initAction(label, id: id)
        gtui_menu_append(self.nativePtr, label.cString, fullID.cString)
        self.labels.append(label)
        return self
    }

    /// Add a button to the end.
    /// - Parameters:
    ///   - label: The button's label.
    ///   - app: The application.
    ///   - shortcut: The button's keyboard shortcut.
    ///   - handler: The button's action handler.
    /// - Returns: The menu.
    public func append(
        _ label: String,
        app: Application,
        shortcut: String = "",
        handler: @escaping () -> Void
    ) -> Menu {
        let id = initAction(label, app: app, shortcut: shortcut, handler: handler)
        return self.append(label, id: id)
    }

    /// Add a button to the end.
    /// - Parameters:
    ///   - label: The button's label.
    ///   - window: The application window.
    ///   - shortcut: The button's keyboard shortcut.
    ///   - handler: The button's action handler.
    /// - Returns: The menu.
    public func append(
        _ label: String,
        window: ApplicationWindow,
        shortcut: String = "",
        handler: @escaping () -> Void
    ) -> Menu {
        let id = initAction(label, win: window, shortcut: shortcut, handler: handler)
        return self.append(label, id: id)
    }

    /// Add a button to the start.
    /// - Parameters:
    ///   - label: The button's label.
    ///   - id: The action's id.
    /// - Returns: The menu.
    public func prepend(_ label: String, id: String) -> Menu {
        let fullID = initAction(label, id: id)
        gtui_menu_prepend(self.nativePtr, label, fullID)
        self.labels.insert(label, at: 0)
        return self
    }

    /// Add a button to the start.
    /// - Parameters:
    ///   - label: The button's label.
    ///   - app: The application.
    ///   - shortcut: The button's keyboard shortcut.
    ///   - handler: The button's action handler.
    /// - Returns: The menu.
    public func prepend(
        _ label: String,
        app: Application,
        shortcut: String = "",
        handler: @escaping () -> Void
    ) -> Menu {
        let id = initAction(label, app: app, shortcut: shortcut, handler: handler)
        return self.prepend(label, id: id)
    }

    /// Add a button to the start.
    /// - Parameters:
    ///   - label: The button's label.
    ///   - window: The application window.
    ///   - shortcut: The button's keyboard shortcut.
    ///   - handler: The button's action handler.
    /// - Returns: The menu.
    public func prepend(
        _ label: String,
        window: ApplicationWindow,
        shortcut: String = "",
        handler: @escaping () -> Void
    ) -> Menu {
        let id = initAction(label, win: window, shortcut: shortcut, handler: handler)
        return self.prepend(label, id: id)
    }

    /// Add a section to the end.
    /// - Parameters:
    ///   - label: The section's label.
    ///   - section: The section.
    /// - Returns: The menu.
    public func append(_ label: String, section: Menu) -> Menu {
        gtui_menu_append_section(self.nativePtr, section.nativePtr)
        self.labels.append(label)
        return self
    }

    /// Add a section to the start.
    /// - Parameters:
    ///   - label: The section's label.
    ///   - section: The section.
    /// - Returns: The menu.
    public func prepend(_ label: String, section: Menu) -> Menu {
        gtui_menu_prepend_section(self.nativePtr, section.nativePtr)
        self.labels.insert(label, at: 0)
        return self
    }

    /// Add a child menu to the end.
    /// - Parameters:
    ///   - label: The child menu's label.
    ///   - submenu: The child menu.
    /// - Returns: The parent menu.
    public func append(_ label: String, submenu: Menu) -> Menu {
        gtui_menu_append_submenu(self.nativePtr, label.cString, submenu.nativePtr)
        self.labels.append(label)
        return self
    }

    /// Add a child menu to the start.
    /// - Parameters:
    ///   - label: The child menu's label.
    ///   - submenu: The child menu.
    /// - Returns: The parent menu.
    public func prepend(_ label: String, submenu: Menu) -> Menu {
        gtui_menu_prepend_submenu(self.nativePtr, label.cString, submenu.nativePtr)
        self.labels.insert(label, at: 0)
        return self
    }

    /// Remove the menu item at a certain position.
    /// - Parameter position: The index.
    public func remove(at position: Int) {
        gtui_menu_remove(self.nativePtr, position.cInt)
        self.labels.remove(at: position)
    }

    /// Remove the menu item with a certain label.
    /// - Parameter label: The label.
    public func remove(_ label: String) {
        if let index = self.labels.firstIndex(of: label) {
            gtui_menu_remove(self.nativePtr, index.cInt)
        }
        self.labels = self.labels.filter { $0 != label }
    }
}
