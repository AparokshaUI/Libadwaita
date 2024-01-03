//
//  SwitchRow.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.SwitchRow
public class SwitchRow: ActionRow {

    /// The handler for when the row's value changes.
    var handler: () -> Void = { }

    /// Initialize a switch row.
    /// - Parameters:
    ///   - title: The row's title.
    ///   - subtitle: The row's subtitle.
    override public init(title: String, subtitle: String) {
        super.init()
        self.nativePtr = gtui_create_switchrow()
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_switchrow_init_signals(self.nativePtr, selfAddr)
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

    /// Set the handler for when the value changes.
    /// - Parameter handler: The handler.
    /// - Returns: The switch row.
    public func onChange(handler: @escaping () -> Void) -> SwitchRow {
        self.handler = handler
        return self
    }
}

/// Handle when the switch row's value changes.
/// - Parameters:
///   - ptr: The pointer.
///   - parameter: The additional data.
///   - userData: The spin row data.
@_cdecl("switchrow_on_change_cb")
func switchrow_on_change_cb(
    ptr: UnsafeMutableRawPointer,
    parameter: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) {
    let row = Unmanaged<SwitchRow>.fromOpaque(userData).takeUnretainedValue()
    row.handler()
}
