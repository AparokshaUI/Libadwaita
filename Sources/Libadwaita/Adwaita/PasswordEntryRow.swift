//
//  PasswordEntryRow.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.PasswordEntryRow
public class PasswordEntryRow: EntryRow {

    /// Initialize a password entry row.
    /// - Parameter title: The row's title.
    override public init(title: String) {
        super.init()
        self.nativePtr = gtui_create_passwordentryrow()
        _ = self.title(title)
    }
}
