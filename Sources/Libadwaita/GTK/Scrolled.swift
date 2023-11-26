//
//  Scrolled.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Gtk.ScrolledWindow
public class Scrolled: NativeWidgetPeer {

    /// Initialize a scrolled window.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_scrolled()
    }

    /// Set the scrolled window's child.
    /// - Parameter widget: The child.
    /// - Returns: The scrolled window.
    public func setChild(_ widget: NativeWidgetPeer) -> Scrolled {
        gtui_scrolled_set_child(self.nativePtr, widget.nativePtr)
        return self
    }
}
