//
//  Button.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI
import Foundation

/// Gtk.Button
public class Button: NativeWidgetPeer {

    /// The action handlers.
    var handlers: [() -> Void] = []
    /// The button content, if there is no label set directly.
    var content: ButtonContent?

    /// Initialize a button with a label.
    /// - Parameter label: The label.
    public init(_ label: String) {
        super.init()
        self.nativePtr = gtui_create_button(label.cString)
        initSignals()
    }

    /// Initialize a button.
    override init() { super.init() }

    // swiftlint:disable function_default_parameter_at_end
    /// Initialize a button with an icon and optionally a label.
    /// - Parameters:
    ///   - label: The label.
    ///   - icon: The icon.
    public convenience init(_ label: String? = nil, icon: Icon) {
        self.init(label ?? "")
        content = ButtonContent(icon: icon, label: label)
        if let content { gtui_button_set_child(self.nativePtr, content.nativePtr) }
    }
    // swiftlint:enable function_default_parameter_at_end

    /// Initialize the button's signals.
    func initSignals() {
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_button_init_signals(self.nativePtr, selfAddr)
    }

    /// Add a handler for the button.
    /// - Parameter handler: The button's handler.
    /// - Returns: The button.
    public func handler(_ handler: @escaping () -> Void) -> Button {
        self.handlers.append(handler)
        return self
    }

    /// Set the label for the button.
    /// - Parameter text: The button's label.
    public func setLabel(_ text: String) { gtui_button_set_label(self.nativePtr, text.cString) }

    /// Get the button content.
    /// - Returns: The button content.
    public func getContent() -> ButtonContent? { content }

    /// Run when the button gets clicked.
    public func onClick() { for handler in self.handlers { handler() } }
}

/// Run when the button gets clicked.
/// - Parameters:
///   - ptr: The pointer.
///   - userData: The button data.
@_cdecl("button_on_click_cb")
func button_on_click_cb(
    ptr: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) {
    let button = Unmanaged<Button>.fromOpaque(userData).takeUnretainedValue()
    button.onClick()
}
