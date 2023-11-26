//
//  TabView.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.TabView
public class TabView: NativeWidgetPeer {

    /// Initialize a tab view.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_tabview()
    }

    /// Append a new tab.
    /// - Parameters:
    ///   - title: The tab's title.
    ///   - widget: The tab's widget.
    ///   - getPage: Get the tab page's identifier.
    /// - Returns: The tab view.
    public func append(
        title: String,
        _ widget: NativeWidgetPeer,
        getPage: (UInt64) -> Void = { _ in }
    ) -> TabView {
        let pagePtr = gtui_tabview_append(self.nativePtr, widget.nativePtr, title.cString)
        getPage(pagePtr)
        return self
    }

    /// Prepend a new tab.
    /// - Parameters:
    ///   - title: The tab's title.
    ///   - widget: The tab's widget.
    ///   - getPage: Get the tab page's identifier.
    /// - Returns: The tab view.
    public func prepend(
        title: String,
        _ widget: NativeWidgetPeer,
        getPage: (UInt64) -> Void = { _ in }
    ) -> TabView {
        let pagePtr = gtui_tabview_prepend(self.nativePtr, widget.nativePtr, title.cString)
        getPage(pagePtr)
        return self
    }
}
