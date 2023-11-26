//
//  PreferencesWindow.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.PreferencesWindow
public class PreferencesWindow: Window {

    /// Initiale a preferences window.
    /// - Parameter parent: The parent window.
    public init(parent: Window? = nil) {
        super.init()
        self.nativePtr = gtui_create_preferenceswindow()
        if let parent { self.setParent(parent) }
    }

    /// Initialize a preferences window.
    /// - Parameter application: The application.
    public required convenience init?(application: Application?) { self.init() }

    /// Add a preferences page.
    /// - Parameter page: The page.
    public func add(page: PreferencesPage) {
        gtui_preferenceswindow_add(self.nativePtr, page.nativePtr)
    }

    /// Add a toast.
    /// - Parameter toast: The toast.
    public func add(toast: Toast) {
        gtui_preferenceswindow_add_toast(self.nativePtr, toast.nativePtr)
    }
}
