//
//  MessageDialog.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.MessageDialog
public class MessageDialog: NativePeer {

    /// The handlers for the buttons.
    var handlers: [String: () -> Void] = [:]

    /// Initialize a message dialog.
    /// - Parameters:
    ///   - parent: The parent window.
    ///   - heading: The heading.
    ///   - body: The body text.
    public init(parent: Window? = nil, heading: String? = nil, body: String? = nil) {
        super.init()
        self.nativePtr = gtui_create_messagedialog(
            parent?.nativePtr ?? 0,
            heading?.cString,
            body?.cString
        )
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_messagedialog_init_signals(self.nativePtr, selfAddr)
    }

    /// Add a response button.
    /// - Parameters:
    ///   - id: The identifier.
    ///   - label: The title.
    ///   - appearance: The response appearance.
    ///   - enabled: Whether it is enabled.
    ///   - type: The response type.
    ///   - handler: The handler for the response.
    /// - Returns: The message dialog.
    public func response(
        id: String,
        label: String,
        appearance: ResponseAppearance = .default,
        enabled: Bool = true,
        type: ResponseType = .default,
        handler: @escaping () -> Void
    ) -> MessageDialog {
        gtui_messagedialog_add_response(
            self.nativePtr,
            id.cString,
            label.cString,
            appearance.rawValue.cInt,
            enabled.cBool,
            type.rawValue.cInt
        )
        handlers[id] = handler
        return self
    }

    /// Set the extra child widget.
    /// - Parameter child: The child widget.
    /// - Returns: The message dialog.
    public func child(_ child: NativeWidgetPeer) -> MessageDialog {
        gtui_messagedialog_set_extra_child(self.nativePtr, child.nativePtr)
        return self
    }

    /// Show the message dialog.
    public func show() { gtui_messagedialog_present(self.nativePtr) }

    /// Close the message dialog.
    public func close() { gtui_window_close(self.nativePtr) }

    /// Run when a button has been clicked.
    /// - Parameter response: The response id.
    public func onClick(_ response: String) { handlers[response]?() }
}

/// Run `onClick` when a button has been clicked.
/// - Parameters:
///   - ptr: The pointer.
///   - response: The response identifier.
///   - userData: The message dialog data.
@_cdecl("messagedialog_on_click_cb")
func messagedialog_on_click_cb(
    ptr: UnsafeMutableRawPointer,
    response: UnsafePointer<CChar>?,
    userData: UnsafeMutableRawPointer
) {
    if let response {
        let messagedialog = Unmanaged<MessageDialog>.fromOpaque(userData).takeUnretainedValue()
        messagedialog.onClick(.init(cString: response))
    }
}
