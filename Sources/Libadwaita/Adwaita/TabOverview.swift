//
//  TabOverview.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.TabOverview
public class TabOverview: NativeWidgetPeer {

    /// A handler for when the "Create Tab" button gets pressed.
    var handler: (() -> UInt64)?

    /// Whether the overview is visible.
    public var overviewPresented: Bool { gtui_taboverview_get_open(self.nativePtr) == 1 }

    /// Initialize a tab overview.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_taboverview()
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_taboverview_init_signals(self.nativePtr, selfAddr)
    }

    /// Add a child and a tab view.
    /// - Parameters:
    ///   - child: The child widget.
    ///   - view: The tab view.
    /// - Returns: The tab overview.
    public func add(_ child: NativeWidgetPeer, view: TabView) -> TabOverview {
        gtui_taboverview_add(self.nativePtr, child.nativePtr, view.nativePtr)
        return self
    }

    /// Set the handler for the "Create Tab" button.
    /// - Parameter handler: The handler.
    /// - Returns: The tab overview.
    public func createTabHandler(_ handler: @escaping () -> UInt64) -> TabOverview {
        self.handler = handler
        gtui_taboverview_show_create_tab(self.nativePtr)
        return self
    }

    /// Show the tab overview.
    public func showOverview() { gtui_taboverview_set_open(self.nativePtr, true.cBool) }

    /// Hide the tab overview.
    public func hideOverview() { gtui_taboverview_set_open(self.nativePtr, false.cBool) }

    /// Run when the "Create Tab" button gets pressed.
    /// - Returns: The new tab.
    public func onCreateTab() -> UInt64 { handler?() ?? 0 }
}

/// Run when the "Create Tab" button gets pressed.
/// - Parameters:
///   - ptr: The pointer.
///   - userData: The tab overview data.
/// - Returns: The new tab's identifier.
@_cdecl("taboverview_on_create_tab_cb")
func taboverview_on_create_tab_cb(
    ptr: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) -> UInt64 {
    let overview = Unmanaged<TabOverview>.fromOpaque(userData).takeUnretainedValue()
    return overview.onCreateTab()
}
