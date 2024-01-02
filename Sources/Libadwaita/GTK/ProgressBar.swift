//
//  ProgressBar.swift
//  Libadwaita
//
//  Created by david-swift on 02.01.24.
//

import CGTUI

/// Gtk.ProgressBar
public class ProgressBar: NativeWidgetPeer {

    /// Initialize a progress bar.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_progressbar()
    }

    /// Set the child view.
    /// - Parameter widget: The child view.
    /// - Returns: The overlay.
    public func fraction(_ fraction: Double) -> ProgressBar {
        gtui_progressbar_set_fraction(self.nativePtr, fraction)
        return self
    }

}
