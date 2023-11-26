//
//  TabButton.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.TabButton
public class TabButton: NativeWidgetPeer {

    /// The handlers of the button.
    var handlers: [() -> Void] = []

    /// Initialize a tab button with a tab view.
    /// - Parameter view: The tab view.
    public init(view: TabView) {
        super.init()
        self.nativePtr = gtui_create_tabbutton(view.nativePtr)
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_tabbutton_init_signals(self.nativePtr, selfAddr)
    }

    /// Set the action handler of the tab button.
    /// - Parameter handler: The action handler.
    /// - Returns: The tab button.
    public func handler(_ handler: @escaping () -> Void) -> TabButton {
        self.handlers.append(handler)
        return self
    }

    /// Run when the button gets clicked.
    public func onClick() { for handler in self.handlers { handler() } }
}

/// Observe when the tab button gets clicked.
/// - Parameters:
///   - ptr: The pointer.
///   - userData: The tab button data.
@_cdecl("tabbutton_on_click_cb")
func tabbutton_on_click_cb(
    ptr: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) {
    let button = Unmanaged<TabButton>.fromOpaque(userData).takeUnretainedValue()
    button.onClick()
}
