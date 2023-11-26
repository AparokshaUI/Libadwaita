//
//  ExpanderRow.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.ExpanderRow
public class ExpanderRow: PreferencesRow {

    /// Initialize an expander row.
    /// - Parameters:
    ///   - title: The row's title.
    ///   - subtitle: The row's subtitle.
    public init(title: String, subtitle: String) {
        super.init()
        self.nativePtr = gtui_create_expanderrow()
        _ = self.title(title)
        _ = self.subtitle(subtitle)
    }

    /// Edit the row's subtitle.
    /// - Parameter subtitle: The new subtitle.
    /// - Returns: The expander row.
    public func subtitle(_ subtitle: String) -> ExpanderRow {
        gtui_expanderrow_set_subtitle(self.nativePtr, subtitle.cString)
        return self
    }

    /// Add a prefix to the expander row.
    /// - Parameter prefix: The prefix.
    /// - Returns: The expander row.
    public func addPrefix(_ prefix: NativeWidgetPeer) -> ExpanderRow {
        gtui_expanderrow_add_prefix(self.nativePtr, prefix.nativePtr)
        return self
    }

    /// Add a child row to the expander row.
    /// - Parameter row: The child row.
    /// - Returns: The expander row.
    public func addRow(_ row: NativeWidgetPeer) -> ExpanderRow {
        gtui_expanderrow_add_row(self.nativePtr, row.nativePtr)
        return self
    }
}
