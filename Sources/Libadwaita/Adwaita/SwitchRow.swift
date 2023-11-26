//
//  SwitchRow.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.SwitchRow
public class SwitchRow: ActionRow {

    /// Initialize a switch row.
    /// - Parameters:
    ///   - title: The row's title.
    ///   - subtitle: The row's subtitle.
    override public init(title: String, subtitle: String) {
        super.init()
        self.nativePtr = gtui_create_switchrow()
        _ = self.title(title)
        _ = self.subtitle(subtitle)
    }

    /// Initialize a switch row.
    override init() { super.init() }

    /// Get whether the switch is active.
    /// - Returns: Whether the switch is active.
    public func getActive() -> Bool { gtui_switchrow_get_active(self.nativePtr) != 0 }

    /// Set whether the switch is active.
    /// - Parameter active: Whether the switch is active.
    public func setActive(_ active: Bool) { gtui_switchrow_set_active(self.nativePtr, active.cBool) }
}
