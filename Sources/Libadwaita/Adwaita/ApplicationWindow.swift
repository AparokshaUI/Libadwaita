//
//  ApplicationWindow.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.ApplicationWindow
public class ApplicationWindow: Window {

    /// Handlers for actions.
    var handlers: [String: () -> Void] = [:]
    /// The parent application.
    private var app: Application

    /// Initialize an application window.
    /// - Parameter app: The application.
    public init(app: Application) {
        self.app = app
        super.init()
        self.nativePtr = gtui_create_application_window(app.nativePtr)
        self.initSignals()
    }

    /// Initialize an application window.
    /// - Parameter application: The application.
    public required convenience init?(application: Application?) {
        if let application {
            self.init(app: application)
        } else {
            return nil
        }
    }

    /// Set the application's child.
    /// - Parameter widget: The child.
    override public func setChild(_ widget: NativeWidgetPeer) {
        gtui_application_window_set_child(self.nativePtr, widget.nativePtr)
    }

    /// Add a keyboard shortcut.
    /// - Parameters:
    ///   - shortcut: The shortcut.
    ///   - id: The identifier.
    ///   - handler: The handler.
    public func addKeyboardShortcut(_ shortcut: String, id: String, handler: @escaping () -> Void) {
        self.handlers[id] = handler
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_application_window_add_keyboard_shortcut(
            self.nativePtr,
            selfAddr,
            app.nativePtr,
            shortcut.cString,
            id.cString,
            "win.\(id)".cString
        )
    }
}

/// Run this when the application window receives an action.
/// - Parameters:
///   - ptr: The pointer.
///   - id: The action's identifier.
///   - userData: The window data.
@_cdecl("application_window_on_action_cb")
func application_window_on_action_cb(
    ptr: UnsafeMutableRawPointer,
    id: UnsafePointer<CChar>?,
    userData: UnsafeMutableRawPointer
) {
    if let id {
        let window = Unmanaged<ApplicationWindow>.fromOpaque(userData).takeUnretainedValue()
        window.handlers[String(cString: id)]?()
    }
}
