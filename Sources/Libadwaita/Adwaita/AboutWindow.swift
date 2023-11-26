//
//  AboutWindow.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.AboutWindow
public class AboutWindow: Window {

    /// Initialize an `AboutWindow`.
    /// - Parameter parent: The parent window.
    public init(parent: Window? = nil) {
        super.init()
        self.nativePtr = gtui_create_aboutwindow()
        if let parent { self.setParent(parent) }
    }

    /// Initialize an `AboutWindow`.
    /// - Parameter application: The parent application.
    public required convenience init?(application: Application?) { self.init() }

    /// Set general data of the about window.
    /// - Parameters:
    ///   - title: The app title.
    ///   - icon: The app icon.
    ///   - developer: The app's developer.
    ///   - version: The app version.
    /// - Returns: The about window.
    public func generalData(title: String, icon: Icon, developer: String, version: String)
    -> AboutWindow {
        gtui_aboutwindow_set_general_data(
            self.nativePtr,
            title.cString,
            icon.string.cString,
            developer.cString,
            version.cString
        )
        return self
    }

    /// Set the app's website.
    /// - Parameter url: The URL.
    /// - Returns: The about window.
    public func website(url: String) -> AboutWindow {
        gtui_aboutwindow_set_website(self.nativePtr, url.cString)
        return self
    }

    /// Set the app's support URL.
    /// - Parameter url: The URL.
    /// - Returns: The about window.
    public func support(url: String) -> AboutWindow {
        gtui_aboutwindow_set_support(self.nativePtr, url.cString)
        return self
    }

    /// Set the app's issues URL.
    /// - Parameter url: The URL.
    /// - Returns: The about window.
    public func issue(url: String) -> AboutWindow {
        gtui_aboutwindow_set_issue(self.nativePtr, url.cString)
        return self
    }

    /// Add a custom link to the about window.
    /// - Parameters:
    ///   - title: The link's title.
    ///   - url: The link's URL.
    /// - Returns: The about window.
    public func addLink(title: String, url: String) -> AboutWindow {
        gtui_aboutwindow_add_link(self.nativePtr, title.cString, url.cString)
        return self
    }

    /// Set the artists.
    /// - Parameter artists: The artists.
    /// - Returns: The about window.
    public func artists(_ artists: [String]) -> AboutWindow {
        gtui_aboutwindow_set_artists(self.nativePtr, artists.cArray)
        return self
    }

    /// Set the designers.
    /// - Parameter designers: The designers.
    /// - Returns: The about window.
    public func designers(_ designers: [String]) -> AboutWindow {
        gtui_aboutwindow_set_designers(self.nativePtr, designers.cArray)
        return self
    }

    /// Set the developers.
    /// - Parameter developers: The developers.
    /// - Returns: The about window.
    public func developers(_ developers: [String]) -> AboutWindow {
        gtui_aboutwindow_set_developers(self.nativePtr, developers.cArray)
        return self
    }

    /// Set the documenters.
    /// - Parameter documenters: The documenters.
    /// - Returns: The about window.
    public func documenters(_ documenters: [String]) -> AboutWindow {
        gtui_aboutwindow_set_documenters(self.nativePtr, documenters.cArray)
        return self
    }

    /// Add a custom credit section.
    /// - Parameters:
    ///   - title: The title.
    ///   - people: The people.
    /// - Returns: The about window.
    public func addCreditSection(title: String, people: [String]) -> AboutWindow {
        gtui_aboutwindow_add_credit_section(self.nativePtr, title.cString, people.cArray)
        return self
    }

    /// Set the copyright string.
    /// - Parameter copyright: The copyright.
    /// - Returns: The about window.
    public func copyright(_ copyright: String) -> AboutWindow {
        gtui_aboutwindow_set_copyright(self.nativePtr, copyright.cString)
        return self
    }

    /// Set the license type.
    /// - Parameter license: The license type.
    /// - Returns: The about window.
    public func license(_ license: License) -> AboutWindow {
        gtui_aboutwindow_set_license(self.nativePtr, license.rawValue.cInt)
        return self
    }
}
