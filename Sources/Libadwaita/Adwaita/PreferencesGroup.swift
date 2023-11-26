//
//  PreferencesGroup.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.PreferencesGroup
public class PreferencesGroup: NativeWidgetPeer {

    /// Initialize a preferences group.
    /// - Parameters:
    ///   - name: The preferences group's name.
    ///   - description: The preferences group's description.
    public init(name: String, description: String) {
        super.init()
        self.nativePtr = gtui_create_preferencesgroup(name.cString, description.cString)
    }

    /// Set the header suffix.
    /// - Parameter suffix: The header suffix.
    /// - Returns: The preferences group.
    public func headerSuffix(_ suffix: NativeWidgetPeer) -> PreferencesGroup {
        gtui_preferencesgroup_header_suffix(self.nativePtr, suffix.nativePtr)
        return self
    }

    /// Add a widget to the group.
    /// - Parameter widget: The widget.
    /// - Returns: The preferences group.
    public func add(_ widget: NativeWidgetPeer) -> PreferencesGroup {
        gtui_preferencesgroup_add(self.nativePtr, widget.nativePtr)
        return self
    }
}
