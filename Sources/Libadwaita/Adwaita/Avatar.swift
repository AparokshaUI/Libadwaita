//
//  Avatar.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.Avatar
public class Avatar: NativeWidgetPeer {

    /// Initialize an avatar.
    /// - Parameters:
    ///   - size: The avatar's size.
    ///   - text: The avatar's text.
    ///   - showInitials: Whether to show the initials.
    public init(size: Int, text: String? = nil, showInitials: Bool = true) {
        super.init()
        self.nativePtr = gtui_create_avatar(size.cInt, text?.cString, showInitials.cBool)
    }

    /// Set the fallback icon.
    /// - Parameter icon: The new fallback icon.
    /// - Returns: The avatar.
    public func fallbackIcon(_ icon: Icon) -> Avatar {
        gtui_avatar_set_icon_name(self.nativePtr, icon.string.cString)
        return self
    }
}
