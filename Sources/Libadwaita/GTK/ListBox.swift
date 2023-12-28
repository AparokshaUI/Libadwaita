//
//  ListBox.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Gtk.ListBox
public class ListBox: NativeWidgetPeer, InsertableContainer {

    /// The child widgets.
    private var peers: [NativeWidgetPeer] = []
    /// Handlers for selecting rows.
    var handler: () -> Void = { }

    override public init() {
        super.init()
        self.nativePtr = gtui_create_listbox()
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_listbox_init_signals(self.nativePtr, selfAddr)
    }

    /// Gtk.ListBoxRow
    class Row: NativeWidgetPeer {

        /// Initialize the list
        /// - Parameter nativePtr: The widget's identifier.
        init(_ nativePtr: UInt64) {
            super.init()
            self.nativePtr = nativePtr
        }

        /// Get the widget's identifier.
        /// - Returns: The widget's identifier.
        func getChild() -> UInt64? {
            if self.nativePtr != 0 {
                return gtk_listboxrow_get_child(self.nativePtr)
            } else {
                return nil
            }
        }
    }

    /// Insert a widget at an index.
    /// - Parameters:
    ///   - widget: The widget.
    ///   - index: The index.
    /// - Returns: The list box.
    public func insert(_ widget: NativeWidgetPeer, at index: Int) -> Self {
        if index == 0 {
            _ = self.prepend(widget)
        } else if index >= peers.count {
            _ = self.append(widget)
        } else {
            gtui_listbox_insert(self.nativePtr, widget.nativePtr, index.cInt)
            self.peers.insert(widget, at: index)
        }
        return self
    }

    /// Add a widget to the end of the list box.
    /// - Parameter widget: The widget.
    /// - Returns: The list box.
    public func append(_ widget: NativeWidgetPeer) -> Self {
        gtui_listbox_append(self.nativePtr, widget.nativePtr)
        self.peers.append(widget)
        return self
    }

    /// Add a widget to the start of the list box.
    /// - Parameter widget: The widget.
    /// - Returns: The list box.
    public func prepend(_ widget: NativeWidgetPeer) -> Self {
        gtui_listbox_prepend(self.nativePtr, widget.nativePtr)
        self.peers.insert(widget, at: 0)
        return self
    }

    /// Remove all the widgets from the list box.
    /// - Returns: The list box.
    public func removeAll() -> Self { removeWidgets(self.peers) }

    /// Remove certain widgets from the list box.
    /// - Parameter widgets: The widgets.
    /// - Returns: The list box.
    public func removeWidgets(_ widgets: [NativeWidgetPeer]) -> Self {
        for peer in widgets {
            gtui_listbox_remove(self.nativePtr, peer.nativePtr)
            self.peers = self.peers.filter { $0.nativePtr != peer.nativePtr }
        }
        return self
    }

    /// Remove the widget at a certain index from the list box.
    /// - Parameter index: The index.
    /// - Returns: The list box.
    public func remove(at index: Int) -> Self { removeWidgets([peers[index]]) }

    /// Get the content of the list box.
    /// - Returns: The content.
    public func getContent() -> [NativeWidgetPeer] { peers }

    /// Select the row at a certain index.
    /// - Parameter index: The index.
    public func selectRow(at index: Int) { gtui_listbox_select_row(self.nativePtr, index.cInt) }

    /// Get the index of the selected row.
    /// - Returns: The index.
    public func getSelectedRow() -> Int? {
        let ptr = gtui_listbox_get_selected_row(self.nativePtr)
        return peers.firstIndex { $0.nativePtr == Row(ptr).getChild() }
    }

    /// Set the style of the list box to the sidebar style.
    /// - Returns: The list box.
    public func sidebarStyle() -> Self {
        _ = self.addStyle("navigation-sidebar")
        return self
    }

    /// Add a handler for when the selection changes.
    /// - Parameter handler: The handler.
    /// - Returns: The list box.
    public func handler(_ handler: @escaping () -> Void) -> Self {
        self.handler = handler
        return self
    }

}

/// Run this function when a row gets selected.
/// - Parameters:
///   - ptr: The pointer.
///   - rowPtr: The pointer to the row.
///   - userData: The list box data.
@_cdecl("listbox_on_select_row_cb")
func listbox_on_select_row_cb(
    ptr: UnsafeMutableRawPointer,
    rowPtr: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) {
    let box = Unmanaged<ListBox>.fromOpaque(userData).takeUnretainedValue()
    box.handler()
}
