//
//  Overlay.swift
//  Libadwaita
//
//  Created by david-swift on 02.01.24.
//

import CGTUI

/// Gtk.Overlay
public class Overlay: NativeWidgetPeer {

    /// Initialize an overlay.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_overlay()
    }

    /// Set the child view.
    /// - Parameter widget: The child view.
    /// - Returns: The overlay.
    public func child(_ widget: NativeWidgetPeer) -> Overlay {
        gtui_overlay_set_child(self.nativePtr, widget.nativePtr)
        return self
    }

    /// Add an overlay to the view.
    /// - Parameter widget: The new overlay view.
    /// - Returns: The overlay.
    public func addOverlay(_ widget: NativeWidgetPeer) -> Overlay {
        gtui_overlay_add_overlay(self.nativePtr, widget.nativePtr)
        return self
    }

}
