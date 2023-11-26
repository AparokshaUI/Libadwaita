//
//  Application.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI
import Foundation

/// Adw.Application
open class Application: NativePeer {

    /// Handlers for actions.
    var handlers: [String: () -> Void] = [:]

    /// Initialize an application.
    /// - Parameter name: The application's name.
    public init(name: String) {
        super.init()
        self.nativePtr = gtui_init_application(name.cString)
    }

    /// Run when the application opens.
    open func onActivate() { }

    /// Add a keyboard shortcut.
    /// - Parameters:
    ///   - shortcut: The keyboard shortcut.
    ///   - id: The action's identifier.
    ///   - handler: The action's handler.
    public func addKeyboardShortcut(_ shortcut: String, id: String, handler: @escaping () -> Void) {
        self.handlers[id] = handler
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_application_add_keyboard_shortcut(
            self.nativePtr,
            selfAddr,
            shortcut.cString,
            id.cString,
            "app.\(id)".cString
        )
    }

    /// Execute the application.
    public func run() { gtui_run_application(self.nativePtr, unsafeBitCast(self, to: UInt64.self)) }
    /// Quit the application.
    public func quit() { gtui_quit_application(self.nativePtr) }

    /// Get the application's active window.
    /// - Returns: The identifier of the active window.
    public func getActiveWindow() -> UInt64? {
        gtui_application_get_active_window(self.nativePtr)
    }
}

/// Run when the application gets activated.
/// - Parameters:
///   - ptr: The pointer.
///   - userData: The app data.
@_cdecl("application_on_activate_cb")
func application_on_activate_cb(
    ptr: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) {
    let app = Unmanaged<Application>.fromOpaque(userData).takeUnretainedValue()
    app.onActivate()
}

/// Run when an action gets executed.
/// - Parameters:
///   - ptr: The pointer.
///   - id: The action's id.
///   - userData: The app data.
@_cdecl("application_on_action_cb")
func application_on_action_cb(
    ptr: UnsafeMutableRawPointer,
    id: UnsafePointer<CChar>?,
    userData: UnsafeMutableRawPointer
) {
    if let id {
        let app = Unmanaged<Application>.fromOpaque(userData).takeUnretainedValue()
        app.handlers[String(cString: id)]?()
    }
}
