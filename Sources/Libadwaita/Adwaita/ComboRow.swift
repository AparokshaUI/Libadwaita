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

    /// Initialize a combo row.
    /// - Parameters:
    ///   - title: The row's title.
    ///   - subtitle: The row's subtitle.
    override public init(title: String, subtitle: String) {
        self.stringListPtr = gtui_create_stringlist()
        super.init()
        self.nativePtr = gtui_create_comborow(self.stringListPtr)
        _ = self.title(title)
        _ = self.subtitle(subtitle)
    }

    /// Append a string.
    /// - Parameter string: The string.
    /// - Returns: The combo row.
    public func append(_ string: String) -> ComboRow {
        gtui_stringlist_append(self.stringListPtr, string.cString)
        return self
    }

    /// Get the selected row.
    /// - Returns: The string of the selected row..
    public func selected() -> String {
        let str = gtui_stringlist_get_selected(self.nativePtr, self.stringListPtr)
        if let str {
            return String(cString: str)
        } else {
            return ""
        }
    }
}
