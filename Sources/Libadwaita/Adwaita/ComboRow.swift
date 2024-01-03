//
//  ComboRow.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.ComboRow
public class ComboRow: ActionRow {

    /// The identifier of the string list.
    private let stringListPtr: UInt64
    /// The content.
    private var strings: [String] = []
    /// The handler gets called when the selection changes.
    var handler: () -> Void = { }

    /// Initialize a combo row.
    /// - Parameters:
    ///   - title: The row's title.
    ///   - subtitle: The row's subtitle.
    override public init(title: String, subtitle: String) {
        self.stringListPtr = gtui_create_stringlist()
        super.init()
        self.nativePtr = gtui_create_comborow(self.stringListPtr)
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_comborow_init_signals(self.nativePtr, selfAddr)
        _ = self.title(title)
        _ = self.subtitle(subtitle)
    }

    /// Append a string.
    /// - Parameter string: The string.
    /// - Returns: The combo row.
    public func append(_ string: String) -> ComboRow {
        gtui_stringlist_append(self.stringListPtr, string.cString)
        strings.append(string)
        return self
    }

    /// Remove a string.
    /// - Parameter index: The index.
    /// - Returns: The combo row.
    public func remove(at index: Int) -> ComboRow {
        gtui_stringlist_remove(self.stringListPtr, index.cInt)
        strings.remove(at: index)
        return self
    }

    /// Get the string content.
    /// - Returns: The content.
    public func getContent() -> [String] {
        strings
    }

    /// Get the selected row.
    /// - Returns: The string of the selected row.
    public func selected() -> String {
        let str = gtui_comborow_get_selected(self.nativePtr, self.stringListPtr)
        if let str {
            return String(cString: str)
        } else {
            return ""
        }
    }

    /// Set the selected row.
    /// - Parameter index: The index of the new selection.
    public func select(at index: Int) {
        gtui_comborow_set_selected(self.nativePtr, index.cInt)
    }

    /// Set a handler for when the selection changes.
    /// - Parameter handler: The handlers.
    /// - Returns: The combo row.
    public func onChange(handler: @escaping () -> Void) -> ComboRow {
        self.handler = handler
        return self
    }

}

/// Handle when the combo row's selection changes.
/// - Parameters:
///   - ptr: The pointer.
///   - parameter: The additional data.
///   - userData: The combo row data.
@_cdecl("comborow_on_change_cb")
func comborow_on_change_cb(
    ptr: UnsafeMutableRawPointer,
    parameter: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) {
    let row = Unmanaged<ComboRow>.fromOpaque(userData).takeUnretainedValue()
    row.handler()
}
