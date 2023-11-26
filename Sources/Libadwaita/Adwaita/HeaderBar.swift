//
//  HeaderBar.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI
import Foundation

/// Adw.HeaderBar
public class HeaderBar: NativeWidgetPeer, Container {

    /// The widgets in the header bar.
    private var peers: [NativeWidgetPeer] = []

    /// Initialize a header bar.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_headerbar()
    }

    /// Set the title widget.
    /// - Parameter widget: The widget.
    /// - Returns: The header bar.
    public func titleWidget(_ widget: NativeWidgetPeer) -> HeaderBar {
        gtui_headerbar_set_title_widget(self.nativePtr, widget.nativePtr)
        return self
    }

    /// Append a widget.
    /// - Parameter widget: The widget.
    /// - Returns: The header bar.
    public func append(_ widget: NativeWidgetPeer) -> Self { self.packEnd(widget) }

    /// Prepend a widget.
    /// - Parameter widget: The widget.
    /// - Returns: The header bar.
    public func prepend(_ widget: NativeWidgetPeer) -> Self { self.packStart(widget) }

    /// Remove all the widgets.
    /// - Returns: The header bar.
    public func removeAll() -> Self { removeWidgets(self.peers) }

    /// Remove a selection of widgets from the header bar.
    /// - Parameter widgets: The widgets.
    /// - Returns: The header bar.
    public func removeWidgets(_ widgets: [NativeWidgetPeer]) -> Self {
        for peer in widgets {
            gtui_headerbar_remove(self.nativePtr, peer.nativePtr)
            self.peers = self.peers.filter { $0.nativePtr != peer.nativePtr }
        }
        return self
    }

    /// Get the header bar's content.
    /// - Returns: The content.
    public func getContent() -> [NativeWidgetPeer] { self.peers }

    /// Add a widget to the beginning of the header bar.
    /// - Parameter widget: The widget.
    /// - Returns: The header bar.
    public func packStart(_ widget: NativeWidgetPeer) -> Self {
        gtui_headerbar_pack_start(self.nativePtr, widget.nativePtr)
        self.peers.append(widget)
        return self
    }

    /// Add a widget to the end of the header bar.
    /// - Parameter widget: The widget.
    /// - Returns: The header bar.
    public func packEnd(_ widget: NativeWidgetPeer) -> Self {
        gtui_headerbar_pack_end(self.nativePtr, widget.nativePtr)
        self.peers.append(widget)
        return self
    }

    /// Show or hide the title buttons.
    /// - Parameter enabled: Whether the title buttons are visible or not.
    /// - Returns: The header bar.
    public func showTitleButtons(_ enabled: Bool) -> HeaderBar {
        gtui_headerbar_set_show_title_buttons(self.nativePtr, enabled.cBool)
        return self
    }
}
