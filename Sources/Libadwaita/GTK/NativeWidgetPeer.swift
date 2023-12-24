//
//  NativeWidgetPeer.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// A widget.
open class NativeWidgetPeer: NativePeer {

    /// The widget's height.
    public var height: Int { .init(gtui_get_height(self.nativePtr)) }

    /// The widget's width.
    public var width: Int { .init(gtui_get_width(self.nativePtr)) }

    /// The closure that gets executed when the widget is being clicked.
    var clickClosure: () -> Void = { }

    /// Initialize a native widget peer.
    override public init() {
        super.init()
    }

    /// Set whether the widget expands horizontally.
    /// - Parameter enabled: Whether the widget expands horizontally.
    /// - Returns: The widget.
    public func hexpand(_ enabled: Bool = true) -> NativeWidgetPeer {
        gtui_set_hexpand(self.nativePtr, enabled.cBool)
        return self
    }

    /// Set whether the widget expands vertically.
    /// - Parameter enabled: Whether the widget expands vertically.
    /// - Returns: The widget.
    public func vexpand(_ enabled: Bool = true) -> NativeWidgetPeer {
        gtui_set_vexpand(self.nativePtr, enabled.cBool)
        return self
    }

    /// The horizontal alignment of the widget.
    /// - Parameter alignment: The alignment.
    /// - Returns: The widget.
    public func halign(_ alignment: Alignment) -> NativeWidgetPeer {
        gtui_set_halign(self.nativePtr, alignment.rawValue.cInt)
        return self
    }

    /// The vertical alignment of the widget.
    /// - Parameter alignment: The alignment.
    /// - Returns: The widget.
    public func valign(_ alignment: Alignment) -> NativeWidgetPeer {
        gtui_set_valign(self.nativePtr, alignment.rawValue.cInt)
        return self
    }

    /// Set the padding for the widget.
    /// - Parameters:
    ///   - padding: The padding.
    ///   - edges: The affected edges.
    /// - Returns: The widget.
    public func padding(_ padding: Int = 10, _ edges: Set<Edge> = .all) -> NativeWidgetPeer {
        for edge in edges {
            switch edge {
            case .leading:
                gtui_set_margin_start(self.nativePtr, padding.cInt)
            case .trailing:
                gtui_set_margin_end(self.nativePtr, padding.cInt)
            case .top:
                gtui_set_margin_top(self.nativePtr, padding.cInt)
            case .bottom:
                gtui_set_margin_bottom(self.nativePtr, padding.cInt)
            }
        }
        return self
    }

    /// Set the minimum width and height of the widget.
    /// - Parameters:
    ///   - minWidth: The minimum width.
    ///   - minHeight: The minimum height.
    /// - Returns: The widget.
    public func frame(minWidth: Int? = nil, minHeight: Int? = nil) -> NativeWidgetPeer {
        gtui_set_size_request(self.nativePtr, (minWidth ?? -1).cInt, (minHeight ?? -1).cInt)
        return self
    }

    /// Set the maximum size of the widget.
    /// - Parameter maxSize: The maximum size.
    /// - Returns: The widget.
    public func frame(maxSize: Int? = nil) -> NativeWidgetPeer {
        if let maxSize {
            return Clamp(self).maximumSize(maxSize)
        } else {
            return self
        }
    }

    /// Add a style class to the widget.
    /// - Parameter style: The name of the style class.
    /// - Returns: The widget.
    public func addStyle(_ style: String) -> NativeWidgetPeer {
        gtui_add_css_class(self.nativePtr, style.cString)
        return self
    }

    /// Enable or disable the widget.
    /// - Parameter sensitive: Whether the widget is enabled or disabled.
    /// - Returns: The widget.
    public func sensitive(_ sensitive: Bool = true) -> NativeWidgetPeer {
        gtui_set_sensitive(self.nativePtr, sensitive.cBool)
        return self
    }

    /// Set a closure that is executed when the widget is being clicked.
    /// - Parameter closure: The closure.
    /// - Returns: The widget.
    public func onClick(closure: @escaping () -> Void) -> NativeWidgetPeer {
        clickClosure = closure
        let selfAddr = unsafeBitCast(self, to: UInt64.self)
        gtui_init_signals(self.nativePtr, selfAddr)
        return self
    }
}

/// Run when the widget gets clicked.
/// - Parameters:
///   - ptr: The pointer.
///   - numberOfPress: Number of press that is paired with this release.
///   - xCoordinate: The X coordinate.
///   - yCoordinate: The Y coordinate.
///   - userData: The widget data.
@_cdecl("on_click_cb")
func on_click_cb(
    ptr: UnsafeMutableRawPointer,
    numberOfPress: Int64,
    xCoordinate: Double,
    yCoordinate: Double,
    userData: UnsafeMutableRawPointer
) {
    let widget = Unmanaged<NativeWidgetPeer>.fromOpaque(userData).takeUnretainedValue()
    widget.clickClosure()
}
