//
//  ViewSwitcher.swift
//  Libadwaita
//
//  Created by david-swift on 25.12.23.
//

import CGTUI

/// Adw.ViewSwitcher
public class ViewSwitcher: NativeWidgetPeer {

    /// The closure that is executed when the selection changes.
    var onSelect: () -> Void = { }

    /// Initialize a view switcher.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_viewswitcher()
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_viewswitcher_init_signals(self.nativePtr, selfAddr)
    }

    /// Add a view.
    /// - Parameters:
    ///     - title: The view's title and identifier.
    ///     - icon: The view's icon.
    /// - Returns: The view switcher.
    public func addOption(title: String, icon: Icon) -> ViewSwitcher {
        gtui_viewswitcher_add_view(self.nativePtr, Label("").nativePtr, title.cString, icon.string.cString)
        return self
    }

    /// Remove a view.
    /// - Parameter title: The view's title.
    /// - Returns: The view switcher.
    public func removeOption(title: String) -> ViewSwitcher {
        gtui_viewswitcher_remove_view(self.nativePtr, title.cString)
        return self
    }

    /// Get the selected view's title.
    /// - Returns: The title.
    public func getSelection() -> String {
        .init(cString: gtui_viewswitcher_get_selection(self.nativePtr))
    }

    /// Select the view with a specific title.
    /// - Parameter title: The title.
    public func select(title: String) {
        gtui_viewswitcher_select(self.nativePtr, title.cString)
    }

    /// Set the closure that gets called when the selection changes.
    /// - Parameter closure: The closure.
    /// - Returns: The view switcher.
    public func onSelect(closure: @escaping () -> Void) -> ViewSwitcher {
        self.onSelect = closure
        return self
    }

    /// Set the wide or narrow design.
    /// - Parameter wide: Whether the design is wide.
    /// - Returns: The view switcher.
    public func wideDesign(_ wide: Bool = true) -> ViewSwitcher {
        gtui_viewswitcher_set_wide_design(self.nativePtr, wide.cBool)
        return self
    }

}

/// Run when the seleciton changes.
/// - Parameters:
///   - ptr: The pointer.
///   - parameter: Additional data.
///   - userData: The switcher data.
@_cdecl("viewswitcher_on_select_cb")
func viewswitcher_on_select_cb(
    ptr: UnsafeMutableRawPointer,
    parameter: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) {
    let switcher = Unmanaged<ViewSwitcher>.fromOpaque(userData).takeUnretainedValue()
    switcher.onSelect()
}
