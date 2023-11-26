//
//  StatusPage.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.StatusPage
public class StatusPage: NativeWidgetPeer {

    /// Initialize a status page.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_statuspage()
    }

    /// Set the title of the status page.
    /// - Parameter title: The new title.
    /// - Returns: The status page.
    public func title(_ title: String) -> StatusPage {
        gtui_statuspage_set_title(self.nativePtr, title.cString)
        return self
    }

    /// Set the description of the status page.
    /// - Parameter description: The new description.
    /// - Returns: The status page.
    public func description(_ description: String) -> StatusPage {
        gtui_statuspage_set_description(self.nativePtr, description.cString)
        return self
    }

    /// Set the icon of the status page.
    /// - Parameter icon: The new icon.
    /// - Returns: The status page.
    public func icon(_ icon: Icon) -> StatusPage {
        gtui_statuspage_set_icon_name(self.nativePtr, icon.string.cString)
        return self
    }

    /// Set the child of the status page.
    /// - Parameter widget: The child.
    /// - Returns: The status page.
    public func child(_ widget: NativeWidgetPeer) -> StatusPage {
        gtui_statuspage_set_child(self.nativePtr, widget.nativePtr)
        return self
    }

}
