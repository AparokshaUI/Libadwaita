//
//  Toast.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.Toast
public class Toast: NativePeer {

    /// The handler for the button of the toast.
    var handlers: [() -> Void] = []

    /// Initialize a toast.
    /// - Parameter title: The toast's title.
    public init(_ title: String) {
        super.init()
        self.nativePtr = gtui_create_toast(title.cString)
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_toast_init_signals(self.nativePtr, selfAddr)
    }

    /// Add a button and set its label.
    /// - Parameter title: The label.
    /// - Returns: The toast.
    public func buttonLabel(_ title: String) -> Toast {
        gtui_toast_set_button(self.nativePtr, title.cString)
        return self
    }

    /// Add a button handler.
    /// - Parameter action: The handler.
    /// - Returns: The toast.
    public func buttonHandler(_ action: @escaping () -> Void) -> Toast {
        handlers.append(action)
        return self
    }

    /// Dismiss the toast.
    public func dismiss() { gtui_toast_dismiss(self.nativePtr) }

    /// Run when the toast's button gets clicked.
    public func onClick() { for handler in handlers { handler() } }
}

/// Run when the toast's button gets clicked.
/// - Parameters:
///   - ptr: The pointer.
///   - userData: The toast data.
@_cdecl("toast_on_click_cb")
func toast_on_click_cb(
    ptr: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) {
    let toast = Unmanaged<Toast>.fromOpaque(userData).takeUnretainedValue()
    toast.onClick()
}
