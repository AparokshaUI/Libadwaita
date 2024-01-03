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
        self.nativePtr = gtui_create_preferencesgroup()
        _ = title(name)
        _ = self.description(description)
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

    /// Set the title of the preferences group.
    /// - Parameter title: The group's title.
    /// - Returns: The preferences group.
    public func title(_ title: String) -> PreferencesGroup {
        gtui_preferencesgroup_set_title(self.nativePtr, title.cString)
        return self
    }

    /// Set the description of the preferences group.
    /// - Parameter description: The group's description.
    /// - Returns: The preferences group.
    public func description(_ description: String) -> PreferencesGroup {
        gtui_preferencesgroup_set_description(self.nativePtr, description.cString)
        return self
    }

}
