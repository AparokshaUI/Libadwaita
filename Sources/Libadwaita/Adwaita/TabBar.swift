//
//  TabBar.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.TabBar
public class TabBar: NativeWidgetPeer {

    /// Initialize a tab bar with a tab view.
    /// - Parameter view: The tab view.
    public init(view: TabView) {
        super.init()
        self.nativePtr = gtui_create_tabbar(view.nativePtr)
    }
}
