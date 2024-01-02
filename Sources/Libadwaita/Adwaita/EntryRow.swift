//
//  EntryRow.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.EntryRow
public class EntryRow: PreferencesRow {

    /// The handlers for when the entry row gets submitted.
    var handler: () -> Void = { }
    /// The handler for when the entry row's text changes.
    var updateHandler: () -> Void = { }

    /// Initialize an entry row.
    /// - Parameter title: The row's title.
    public init(title: String) {
        super.init()
        self.nativePtr = gtui_create_entryrow()
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_entryrow_init_signals(self.nativePtr, selfAddr)
        _ = self.title(title)
    }

    /// Initialize an entry row.
    override init() { super.init() }

    /// Add a prefix to the entry row.
    /// - Parameter prefix: The prefix.
    /// - Returns: The entry row.
    public func addPrefix(_ prefix: NativeWidgetPeer) -> EntryRow {
        gtui_entryrow_add_prefix(self.nativePtr, prefix.nativePtr)
        return self
    }

    /// Add a suffix to the entry row.
    /// - Parameter suffix: The suffix.
    /// - Returns: The entry row.
    public func addSuffix(_ suffix: NativeWidgetPeer) -> EntryRow {
        gtui_entryrow_add_suffix(self.nativePtr, suffix.nativePtr)
        return self
    }

    /// Add a submit handler to the entry row.
    /// - Parameter handler: The handler.
    /// - Returns: The entry row.
    public func submitHandler(_ handler: @escaping () -> Void) -> EntryRow {
        self.handler = handler
        gtui_entryrow_set_show_apply_button(self.nativePtr, true.cBool)
        return self
    }

    /// Get the content of the entry row.
    /// - Returns: The content.
    public func contents() -> String {
        let contents = gtui_editable_contents(self.nativePtr)
        if let contents {
            return .init(cString: contents)
        } else {
            return ""
        }
    }

    /// Set the content of the entry row.
    /// - Parameter text: The new content.
    public func setContents(_ text: String) {
        gtui_editable_set_contents(self.nativePtr, text.cString)
    }

    /// Observe updates in the written text.
    /// - Parameter handler: The handler.
    /// - Returns: The entry row.
    public func changeHandler(_ handler: @escaping () -> Void) -> EntryRow {
        self.updateHandler = handler
        return self
    }

}

/// Handle when the entry row gets submitted.
/// - Parameters:
///   - ptr: The pointer.
///   - userData: The entry row data.
@_cdecl("entryrow_on_submit_cb")
func entryrow_on_submit_cb(
    ptr: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) {
    let entryrow = Unmanaged<EntryRow>.fromOpaque(userData).takeUnretainedValue()
    entryrow.handler()
}

/// Handle when the entry row gets updated.
/// - Parameters:
///   - ptr: The pointer.
///   - userData: The entry row data.
@_cdecl("entryrow_on_update_cb")
func entryrow_on_update_cb(
    ptr: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) {
    let entryrow = Unmanaged<EntryRow>.fromOpaque(userData).takeUnretainedValue()
    entryrow.updateHandler()
}
