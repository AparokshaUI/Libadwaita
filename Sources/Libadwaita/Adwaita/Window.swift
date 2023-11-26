//
//  Window.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.Window
public class Window: NativePeer {

    /// Whether the window is maximized.
    public var isMaximized: Bool { gtui_window_is_maximized(self.nativePtr) != 0 }
    /// The handler that gets called when the window is being closed.
    private var closeHandler: (() -> Bool)?

    /// Initialize a window.
    /// - Parameter app: The parent application.
    public init(app: Application?) {
        super.init()
        if let addr = app {
            self.nativePtr = gtui_create_window(addr.nativePtr)
        } else {
            self.nativePtr = gtui_create_window(0)
        }
        self.initSignals()
    }

    /// Initialize a window.
    /// - Parameter application: The parent application.
    public required convenience init?(application: Application?) { self.init(app: application) }

    /// Initialize a window.
    override init() { super.init() }

    /// Show the window.
    public func show() { gtui_show_window(self.nativePtr) }

    /// Set the window's child widget.
    /// - Parameter widget: The widget.
    public func setChild(_ widget: NativeWidgetPeer) {
        gtui_window_set_child(self.nativePtr, widget.nativePtr)
    }

    /// Set the window's parent window.
    /// - Parameter window: The parent window.
    public func setParent(_ window: Window) {
        gtui_window_set_transient_for(self.nativePtr, window.nativePtr)
    }

    /// Set the window's title.
    /// - Parameter title: The window title.
    public func setTitle(_ title: String) {
        gtui_window_set_title(self.nativePtr, title.cString)
    }

    /// Maximize the window.
    public func maximize() { gtui_window_maximize(self.nativePtr) }

    /// Unmaximize the window.
    public func unmaximize() { gtui_window_unmaximize(self.nativePtr) }

    /// Enter fullscreen.
    public func fullscreen() { gtui_window_enter_fullscreen(self.nativePtr) }

    /// Unfullscreen the window.
    public func unfullscreen() { gtui_window_leave_fullscreen(self.nativePtr) }

    /// Minimize the window.
    public func minimize() { gtui_window_minimize(self.nativePtr) }

    /// Close the window.
    public func close() { gtui_window_close(self.nativePtr) }

    /// Set the window's initial size.
    /// - Parameters:
    ///   - width: The window's width.
    ///   - height: The window's height.
    public func setDefaultSize(width: Int?, height: Int?) {
        gtui_window_set_default_size(self.nativePtr, width?.cInt ?? -1, height?.cInt ?? -1)
    }

    /// Set the window's resizability.
    /// - Parameter resizable: Whether the window is resizable.
    public func setResizability(_ resizable: Bool) {
        gtui_window_set_resizability(self.nativePtr, resizable.cBool)
    }

    /// Set the window's deletability.
    /// - Parameter deletable: Whether the window is deletable.
    public func setDeletability(_ deletable: Bool) {
        gtui_window_set_deletability(self.nativePtr, deletable.cBool)
    }

    /// Observe whether a window is being closed.
    /// - Parameter run: The handler, returning whether the window should stay open.
    public func observeHide(_ run: @escaping () -> Bool) { self.closeHandler = run }

    /// Run when a window requests to get closed.
    /// - Returns: Whether the window should stay open.
    func onHide() -> Bool { self.closeHandler?() ?? false }

    /// Initialize the window's signals.
    func initSignals() {
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_window_init_signals(self.nativePtr, selfAddr)
    }
}

/// Run when the window requests to get closed.
/// - Parameters:
///   - ptr: The pointer.
///   - userData: The window data.
/// - Returns: Whether the window should stay open.
@_cdecl("window_close_cb")
func window_close_cb(
    ptr: UnsafeMutableRawPointer,
    userData: UnsafeMutableRawPointer
) -> Int32 {
    let window = Unmanaged<Window>.fromOpaque(userData).takeUnretainedValue()
    return window.onHide().cBool
}
