//
//  SpinRow.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.SpinRow
public class SpinRow: ActionRow {

    /// Initialize a spin row.
    /// - Parameters:
    ///   - title: The spin row's title.
    ///   - subtitle: The spin row's subtitle.
    ///   - min: The spin row's minimum value.
    ///   - max: The spin row's maximum value.
    ///   - step: The spin row's increase/decrease step.
    public init(title: String, subtitle: String, min: Double, max: Double, step: Double) {
        super.init()
        self.nativePtr = gtui_create_spinrow(min, max, step)
        _ = self.title(title)
        _ = self.subtitle(subtitle)
    }

    /// Initialize a spin row.
    override init() { super.init() }

    /// Set the configuration.
    /// - Parameters:
    ///   - min: The minimum value.
    ///   - max: The maximum value.
    ///   - step: The increase/decrease step.
    /// - Returns: The spin row.
    public func configuration(min: Double, max: Double, step: Double) -> SpinRow {
        gtui_spinrow_set_configuration(self.nativePtr, min, max, step)
        return self
    }

    /// Get a spin row's value.
    /// - Returns: The value.
    public func getValue() -> Double { gtui_spinrow_get_value(self.nativePtr) }

    /// Set a spin row's value.
    /// - Parameter value: The value.
    public func setValue(_ value: Double) { gtui_spinrow_set_value(self.nativePtr, value) }
}
