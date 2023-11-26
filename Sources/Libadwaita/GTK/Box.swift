//
//  Box.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Gtk.Box
public class Box: NativeWidgetPeer, InsertableContainer {

    /// The content.
    private var peers: [NativeWidgetPeer] = []

    /// Initialize a box.
    /// - Parameters:
    ///   - horizontal: Whether the box is horizontal.
    ///   - spacing: The spacing between the single elements.
    public init(horizontal: Bool = true, spacing: Int = 0) {
        super.init()
        self.nativePtr = gtui_create_box(horizontal.cBool, spacing.cInt)
    }

    /// Insert a widget into the box.
    /// - Parameters:
    ///   - widget: The widget.
    ///   - index: The index.
    /// - Returns: The box.
    public func insert(_ widget: NativeWidgetPeer, at index: Int) -> Self {
        if index == 0 {
            _ = self.prepend(widget)
        } else if index >= peers.count {
            _ = self.append(widget)
        } else {
            gtui_box_insert_after(self.nativePtr, widget.nativePtr, peers[index - 1].nativePtr)
            self.peers.insert(widget, at: index)
        }
        return self
    }

    /// Add a widget to the end of the box.
    /// - Parameter widget: The widget.
    /// - Returns: The box.
    public func append(_ widget: NativeWidgetPeer) -> Self {
        gtui_box_append(self.nativePtr, widget.nativePtr)
        self.peers.append(widget)
        return self
    }

    /// Add a widget to the start of the box.
    /// - Parameter widget: The widget.
    /// - Returns: The box.
    public func prepend(_ widget: NativeWidgetPeer) -> Self {
        gtui_box_prepend(self.nativePtr, widget.nativePtr)
        self.peers.insert(widget, at: 0)
        return self
    }

    /// Remove all widgets from the box.
    /// - Returns: The box.
    public func removeAll() -> Self { removeWidgets(self.peers) }

    /// Remove certain widgets from the box.
    /// - Parameter widgets: The widgets to remove.
    /// - Returns: The box.
    public func removeWidgets(_ widgets: [NativeWidgetPeer]) -> Self {
        for peer in widgets {
            gtui_box_remove(self.nativePtr, peer.nativePtr)
            self.peers = self.peers.filter { $0.nativePtr != peer.nativePtr }
        }
        return self
    }

    /// Get the content of the box.
    /// - Returns: The widgets in the box.
    public func getContent() -> [NativeWidgetPeer] { peers }
}
