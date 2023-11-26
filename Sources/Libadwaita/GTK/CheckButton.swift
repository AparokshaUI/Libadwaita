//
//  CheckButton.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Gtk.CheckButton
public class CheckButton: NativeWidgetPeer {

    /// The handlers for a check button.
    var handlers: [() -> Void] = []

    /// Initialize a check button.
    /// - Parameter label: The check button's label.
    public init(_ label: String) {
        super.init()
        self.nativePtr = gtui_create_checkbutton(label.cString)
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_checkbutton_init_signals(self.nativePtr, selfAddr)
    }

    /// Add a handler for the check button.
    /// - Parameter handler: The handler.
    /// - Returns: The check button.
    public func handler(_ handler: @escaping () -> Void) -> CheckButton {
        self.handlers.append(handler)
        return self
    }

    /// Set the check button's label.
    /// - Parameter text: The label.
    public func setLabel(_ text: String) { gtui_checkbutton_set_label(self.nativePtr, text.cString) }

    /// Set whether the check button is active.
    /// - Parameter active: Whether the check button is active.
    public func setActive(_ active: Bool) {
        gtui_checkbutton_set_active(self.nativePtr, active.cBool)
    }

    /// Set whether the check button is in the inconsistent state.
    /// - Parameter inconsistent: Whether the check button is in the inconsistent state.
    public func setInconsistent(_ inconsistent: Bool) {
        gtui_checkbutton_set_inconsistent(self.nativePtr, inconsistent.cBool)
    }

    /// Run this when the check button gets clicked.
    public func onClick() { for handler in self.handlers { handler() } }
}

/// Run this when the check button gets clicked.
/// - Parameters:
///   - ptr: The pointer.
///   - userData: The check button data.
@_cdecl("checkbutton_on_toggle_cb")
func checkbutton_on_toggle_cb(
    ptr: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) {
    let button = Unmanaged<CheckButton>.fromOpaque(userData).takeUnretainedValue()
    button.onClick()
}
