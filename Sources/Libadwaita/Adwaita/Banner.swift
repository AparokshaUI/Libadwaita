//
//  Banner.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.Banner
public class Banner: NativeWidgetPeer {

    /// The handlers for when the button gets clicked.
    var handler: () -> Void = { }
    /// Whether the banner is revealed.
    public var isRevealed: Bool { gtui_banner_is_revealed(self.nativePtr) != 0 }

    /// Initialize a banner.
    /// - Parameter title: The banner's label.
    public init(_ title: String) {
        super.init()
        self.nativePtr = gtui_create_banner(title.cString)
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_banner_init_signals(self.nativePtr, selfAddr)
    }

    /// Edit the banner's label.
    /// - Parameter title: The label.
    /// - Returns: The banner.
    public func title(_ title: String) -> Banner {
        gtui_banner_set_title(self.nativePtr, title.cString)
        return self
    }

    /// Add a button to the banner and set its label.
    /// - Parameter title: The label.
    /// - Returns: The banner.
    public func buttonLabel(_ title: String) -> Banner {
        gtui_banner_set_button(self.nativePtr, title.cString)
        return self
    }

    /// Add a handler for the banner's button.
    /// - Parameter action: The handler.
    /// - Returns: The banner.
    public func buttonHandler(_ action: @escaping () -> Void) -> Banner {
        handler = action
        return self
    }

    /// Show the banner.
    public func show() { gtui_banner_set_revealed(self.nativePtr, true.cBool) }

    /// Hide the banner.
    public func hide() { gtui_banner_set_revealed(self.nativePtr, false.cBool) }
}

/// Run when the banner's button gets clicked.
/// - Parameters:
///   - ptr: The pointer.
///   - userData: The banner data.
@_cdecl("banner_on_click_cb")
func banner_on_click_cb(
    ptr: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) {
    let banner = Unmanaged<Banner>.fromOpaque(userData).takeUnretainedValue()
    banner.handler()
}
