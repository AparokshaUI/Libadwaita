//
//  ToolbarView.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.ToolbarView
public class ToolbarView: NativeWidgetPeer {

    /// Initialize a toolbar view.
    /// - Parameter child: The child view.
    public init(_ child: NativeWidgetPeer) {
        super.init()
        self.nativePtr = gtui_create_toolbarview(child.nativePtr)
    }

    /// Add a bottom bar.
    /// - Parameter child: The child view.
    /// - Returns: The toolbar view.
    public func addBottomBar(_ child: NativeWidgetPeer) -> ToolbarView {
        gtui_toolbarview_add_bottom_bar(self.nativePtr, child.nativePtr)
        return self
    }

    /// Add a top bar.
    /// - Parameter child: The child view.
    /// - Returns: The toolbar view.
    public func addTopBar(_ child: NativeWidgetPeer) -> ToolbarView {
        gtui_toolbarview_add_top_bar(self.nativePtr, child.nativePtr)
        return self
    }

    /// Set whether the bottom bar is visible.
    /// - Parameter revealed: Whether the bottom bar is visible.
    public func setRevealBottomBar(_ revealed: Bool) {
        gtui_toolbarview_set_reveal_bottom_bar(self.nativePtr, revealed.cBool)
    }

    /// Set whether the top bar is visible.
    /// - Parameter revealed: Whether the top bar is visible.
    public func setRevealTopBar(_ revealed: Bool) {
        gtui_toolbarview_set_reveal_top_bar(self.nativePtr, revealed.cBool)
    }

    /// Set the style of the bottom bar.
    /// - Parameter style: The style.
    /// - Returns: The toolbar view.
    public func bottomBarStyle(_ style: ToolbarStyle) -> ToolbarView {
        gtui_toolbarview_set_top_bar_style(self.nativePtr, style.rawValue.cInt)
        return self
    }

    /// Set the style of the top bar.
    /// - Parameter style: The style.
    /// - Returns: The toolbar view.
    public func topBarStyle(_ style: ToolbarStyle) -> ToolbarView {
        gtui_toolbarview_set_top_bar_style(self.nativePtr, style.rawValue.cInt)
        return self
    }
}
