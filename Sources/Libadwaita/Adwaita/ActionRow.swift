//
//  ActionRow.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.ActionRow
public class ActionRow: PreferencesRow {

    /// Initialize an `ActionRow`.
    /// - Parameters:
    ///   - title: The row title.
    ///   - subtitle: The row subtitle.
    public init(title: String, subtitle: String) {
        super.init()
        self.nativePtr = gtui_create_actionrow()
        _ = self.title(title)
        _ = self.subtitle(subtitle)
    }

    /// Initialize an action row.
    override init() { super.init() }

    /// Set the row's subtitle.
    /// - Parameter subtitle: The subtitle.
    /// - Returns: The action row.
    public func subtitle(_ subtitle: String) -> ActionRow {
        gtui_actionrow_set_subtitle(self.nativePtr, subtitle.cString)
        return self
    }

    /// Add a prefix to the action row.
    /// - Parameter prefix: The prefix.
    /// - Returns: The action row.
    public func addPrefix(_ prefix: NativeWidgetPeer) -> ActionRow {
        gtui_actionrow_add_prefix(self.nativePtr, prefix.nativePtr)
        return self
    }

    /// Add a suffix to the action row.
    /// - Parameter suffix: The suffix.
    /// - Returns: The action row.
    public func addSuffix(_ suffix: NativeWidgetPeer) -> ActionRow {
        gtui_actionrow_add_suffix(self.nativePtr, suffix.nativePtr)
        return self
    }
}
