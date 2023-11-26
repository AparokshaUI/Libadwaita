//
//  NavigationSplitView.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.NavigationSplitView
public class NavigationSplitView: NativeWidgetPeer {

    /// Initialize a navigation split view.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_navigationsplitview()
    }

    /// Set the split view's sidebar.
    /// - Parameters:
    ///   - view: The view.
    ///   - title: The sidebar's title.
    /// - Returns: The navigation split view.
    public func sidebar(_ view: NativeWidgetPeer, title: String) -> NavigationSplitView {
        gtui_navigationsplitview_set_sidebar(self.nativePtr, view.nativePtr, title.cString)
        return self
    }

    /// Set the navigation split view's content view.
    /// - Parameters:
    ///   - view: The view.
    ///   - title: The content view's title.
    /// - Returns: The navigation split view.
    public func content(_ view: NativeWidgetPeer, title: String) -> NavigationSplitView {
        gtui_navigationsplitview_set_content(self.nativePtr, view.nativePtr, title.cString)
        return self
    }
}
