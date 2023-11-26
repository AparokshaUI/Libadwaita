//
//  ToastOverlay.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.ToastOverlay
public class ToastOverlay: NativeWidgetPeer {

    /// Initialize a toast overlay.
    /// - Parameter child: The child view.
    public init(_ child: NativeWidgetPeer) {
        super.init()
        self.nativePtr = gtui_create_toastoverlay(child.nativePtr)
    }

    /// Add a toast.
    /// - Parameter toast: The toast.
    public func addToast(_ toast: Toast) {
        gtui_toastoverlay_add_toast(self.nativePtr, toast.nativePtr)
    }
}
