//
//  PreferencesPage.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.PreferencesPage
public class PreferencesPage: NativeWidgetPeer {

    /// Initialize a preferences page.
    /// - Parameters:
    ///   - name: The page's name.
    ///   - icon: The page's icon.
    ///   - description: The page's description.
    public init(name: String, icon: Icon, description: String) {
        super.init()
        self.nativePtr = gtui_create_preferencespage(
            name.cString,
            icon.string.cString,
            description.cString
        )
    }

    /// Add a preferences group.
    /// - Parameter group: The preferences group.
    /// - Returns: The preferences page.
    public func add(group: PreferencesGroup) -> PreferencesPage {
        gtui_preferencespage_add(self.nativePtr, group.nativePtr)
        return self
    }
}
