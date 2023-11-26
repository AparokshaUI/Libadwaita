//
//  Clamp.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.Clamp
public class Clamp: NativeWidgetPeer {

    /// Initialize a clamp.
    /// - Parameter widget: The content widget.
    public init(_ widget: NativeWidgetPeer) {
        super.init()
        self.nativePtr = gtui_create_clamp(widget.nativePtr)
    }

    /// Set the maximum size of the clamp.
    /// - Parameter size: The size.
    /// - Returns: The clamp.
    public func maximumSize(_ size: Int) -> Clamp {
        gtui_clamp_set_maximum_size(self.nativePtr, size.cInt)
        return self
    }
}
