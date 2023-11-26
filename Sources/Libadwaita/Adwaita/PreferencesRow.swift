//
//  PreferencesRow.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.PreferencesRow
public class PreferencesRow: NativeWidgetPeer {

    /// Set the title of the preferences row.
    /// - Parameter title: The row's title.
    /// - Returns: The preferences row.
    public func title(_ title: String) -> PreferencesRow {
        gtui_preferencesrow_set_title(self.nativePtr, title.cString)
        return self
    }
}
