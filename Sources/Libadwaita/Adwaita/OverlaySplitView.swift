//
//  OverlaySplitView.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.OverlaySplitView
public class OverlaySplitView: NativeWidgetPeer {

    /// Initialize an overlay split view.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_overlaysplitview()
    }

    /// Set the sidebar widget.
    /// - Parameter view: The widget.
    /// - Returns: The overlay split view.
    public func sidebar(_ view: NativeWidgetPeer) -> OverlaySplitView {
        gtui_overlaysplitview_set_sidebar(self.nativePtr, view.nativePtr)
        return self
    }

    /// Set the content widget.
    /// - Parameter view: The widget.
    /// - Returns: The overlay split view.
    public func content(_ view: NativeWidgetPeer) -> OverlaySplitView {
        gtui_overlaysplitview_set_content(self.nativePtr, view.nativePtr)
        return self
    }

    /// Set the position of the sidebar.
    /// - Parameter trailing: Whether the sidebar is at the trailing position.
    /// - Returns: The overlay split view.
    public func position(trailing: Bool = false) -> OverlaySplitView {
        gtui_overlaysplitview_set_position(self.nativePtr, trailing.cBool)
        return self
    }

    /// Show the sidebar.
    public func showSidebar() { gtui_overlaysplitview_show_sidebar(self.nativePtr) }

    /// Hide the sidebar.
    public func hideSidebar() { gtui_overlaysplitview_hide_sidebar(self.nativePtr) }
}
