//
//  NavigationView.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.NavigationView
public class NavigationView: NativeWidgetPeer {

    /// The views in the navigation view.
    private var peers: [UInt64] = []

    /// Initilaize a navigation view.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_navigationview()
    }

    /// Add a view to the navigaiton view.
    /// - Parameters:
    ///   - widget: The view.
    ///   - title: The view's title.
    /// - Returns: The navigation view.
    public func add(_ widget: NativeWidgetPeer, title: String) -> NavigationView {
        peers.append(gtui_navigationview_add(self.nativePtr, widget.nativePtr, title.cString))
        return self
    }

    /// Remove the last widget of the navigation view.
    /// - Returns: The navigation view.
    public func pop() -> NavigationView { removeWidgets([peers.last ?? 0], pop: true) }

    /// Remove all widgets.
    /// - Returns: The navigation view.
    public func removeAll() -> NavigationView { removeWidgets(self.peers) }

    /// Remove widgets with certain IDs.
    /// - Parameters:
    ///   - widgets: The IDs.
    ///   - pop: Whether to pop.
    /// - Returns: The navigation view.
    public func removeWidgets(_ widgets: [UInt64], pop: Bool = false) -> NavigationView {
        for peer in widgets {
            gtui_navigationview_remove(self.nativePtr, peer, pop.cBool)
            self.peers = self.peers.filter { $0 != peer }
        }
        return self
    }

    /// Get the content widgets' identifiers.
    /// - Returns: The identifiers.
    public func getContent() -> [UInt64] { peers }
}
